import 'dart:async';
import 'package:amar_thikana/data/services/social_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:amar_thikana/data/services/firebase_auth_service.dart';
import 'package:amar_thikana/domain/models/user/renter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/errors/app_exceptions.dart';
import '../../core/errors/failure.dart';
import '../../core/network/network_info.dart';
import '../../domain/models/user/user.dart';
import '../../domain/repository/auth_repository_interface.dart';
import '../datasources/local/auth_local_datasource.dart';
import '../datasources/remote/auth_remote_datasource.dart';

class AuthRepository implements IAuthRepository {
  final IAuthRemoteDataSource _remoteDataSource;
  final IAuthLocalDataSource _localDataSource;
  final INetworkInfo _networkInfo;
  final IFirebaseAuthService _firebaseAuthService;

  // Stream controller for auth state changes
  final StreamController<User?> _authStateController =
      StreamController<User?>.broadcast();

  AuthRepository(Ref ref)
    : _remoteDataSource = ref.read(authRemoteDataSourceProvider),
      _localDataSource = ref.read(authLocalDataSourceProvider),
      _networkInfo = ref.read(networkInfoProvider),
      _firebaseAuthService = ref.read(firebaseAuthServiceProvider) {
    // Initialize auth state
    _initAuthState();
  }

  Future<void> _initAuthState() async {
    // Check if user is logged in
    final isLoggedIn = await _localDataSource.isLoggedIn();
    if (isLoggedIn) {
      final user = await _localDataSource.getCachedUserData();
      _authStateController.add(user);
    } else {
      _authStateController.add(null);
    }

    // Listen to Firebase auth state changes
    _firebaseAuthService.authStateChanges.listen((firebaseUser) async {
      if (firebaseUser != null) {
        // User is logged in with Firebase
        final user = await _localDataSource.getCachedUserData();
        if (user != null) {
          _authStateController.add(user);
        } else {
          // Try to get user data from Firebase
          try {
            // Create a basic user from Firebase data
            final newUser = User(
              id: firebaseUser.uid,
              email: firebaseUser.email ?? '',
              name: firebaseUser.displayName ?? '',
              userType: UserType.renter, // Ensure enum is used correctly
              isVerified: true,
              createdAt: DateTime.now(), // Using current timestamp as default
              lastActive: DateTime.now(), // Optional: set last active time
              photoUrl: firebaseUser.photoURL, // If available
              phoneNumber: firebaseUser.phoneNumber, // If available
              address: null, // Provide actual address if available
              renterDetails:
                  Renter(), // Assuming a blank renter object if needed
            );

            // Cache user data
            await _localDataSource.cacheUserData(newUser);
            _authStateController.add(newUser);
          } catch (e) {
            _authStateController.add(null);
          }
        }
      } else {
        // User is not logged in with Firebase
        _authStateController.add(null);
      }
    });
  }

  @override
  Future<User> login({required String email, required String password}) async {
    if (!(await _networkInfo.isConnected)) {
      throw Failure('No internet connection');
    }

    try {
      // First try login with Firebase
      final firebaseUser = await _firebaseAuthService
          .signInWithEmailAndPassword(email: email, password: password);

      if (firebaseUser == null) {
        throw Failure('Failed to authenticate with Firebase');
      }

      try {
        // Then get user data from API
        final response = await _remoteDataSource.login(
          email: email,
          password: password,
        );

        // Extract user data and token
        final userData = response['user'];
        final token = response['token'];

        // Create user object
        final user = User.fromJson(userData);

        // Cache user data and token
        await _localDataSource.cacheUserData(user);
        await _localDataSource.saveAuthToken(token);

        // Notify listeners
        _authStateController.add(user);

        return user;
      } catch (apiError) {
        // If API fails but Firebase succeeded, create basic user from Firebase
        final basicUser = User(
          id: firebaseUser.uid,
          email: firebaseUser.email ?? '',
          name: firebaseUser.displayName ?? '',
          userType: UserType.renter,
          isVerified: firebaseUser.emailVerified,
          createdAt: DateTime.now(),
          lastActive: DateTime.now(),
          photoUrl: firebaseUser.photoURL,
          phoneNumber: firebaseUser.phoneNumber,
        );

        // Cache basic user data
        await _localDataSource.cacheUserData(basicUser);
        _authStateController.add(basicUser);

        return basicUser;
      }
    } on ServerException catch (e) {
      throw Failure(e.message);
    } on FirebaseAuthException catch (e) {
      throw Failure(e.message);
    } catch (e) {
      throw Failure('Failed to login: ${e.toString()}');
    }
  }

  @override
  Future<User> register({
    required String email,
    required String password,
    required String name,
    required String userType,
    required String phone,
  }) async {
    if (!(await _networkInfo.isConnected)) {
      throw Failure('No internet connection');
    }

    firebase_auth.User? firebaseUser;
    try {
      // First create user in Firebase
      firebaseUser = await _firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (firebaseUser == null) {
        throw Failure('Failed to create Firebase account');
      }

      // Update display name
      await _firebaseAuthService.updateDisplayName(name);

      try {
        // Then register user in API
        final response = await _remoteDataSource.register(
          email: email,
          password: password,
          name: name,
          userType: userType,
          phone: phone,
        );

        // Extract user data and token
        final userData = response['user'];
        final token = response['token'];

        // Create user object
        final user = User.fromJson(userData);

        // Cache user data and token
        await _localDataSource.cacheUserData(user);
        await _localDataSource.saveAuthToken(token);

        // Notify listeners
        _authStateController.add(user);

        return user;
      } catch (apiError) {
        // If API registration fails, create a basic user from Firebase data
        final basicUser = User(
          id: firebaseUser.uid,
          email: firebaseUser.email ?? '',
          name: name,
          userType:
              userType == 'landlord' ? UserType.landlord : UserType.renter,
          isVerified: firebaseUser.emailVerified,
          createdAt: DateTime.now(),
          lastActive: DateTime.now(),
          photoUrl: firebaseUser.photoURL,
          phoneNumber: phone,
        );

        // Cache basic user data
        await _localDataSource.cacheUserData(basicUser);
        _authStateController.add(basicUser);

        return basicUser;
      }
    } catch (e) {
      // If Firebase registration failed, attempt to clean up
      if (firebaseUser != null) {
        try {
          await firebaseUser.delete();
        } catch (_) {
          // Ignore cleanup errors
        }
      }

      if (e is ServerException) {
        throw Failure(e.message);
      } else if (e is FirebaseAuthException) {
        throw Failure(e.message);
      }
      throw Failure('Failed to register: ${e.toString()}');
    }
  }

  @override
  Future<bool> logout() async {
    try {
      // Sign out from Firebase
      await _firebaseAuthService.signOut();

      // Clear local cache
      await _localDataSource.clearCachedUserData();
      await _localDataSource.clearAuthToken();

      // Notify listeners
      _authStateController.add(null);

      return true;
    } catch (e) {
      throw Failure('Failed to logout: ${e.toString()}');
    }
  }

  @override
  Future<bool> forgotPassword(String email) async {
    if (!(await _networkInfo.isConnected)) {
      throw Failure('No internet connection');
    }

    try {
      // Send reset email via Firebase first
      await _firebaseAuthService.sendPasswordResetEmail(email);

      try {
        // Try with backend API as well, but don't fail if it doesn't work
        await _remoteDataSource.forgotPassword(email);
      } catch (e) {
        // Log the error but don't fail the operation since Firebase reset worked
        print('Backend password reset failed: $e');
      }

      return true;
    } on FirebaseAuthException catch (e) {
      throw Failure(e.message);
    } catch (e) {
      throw Failure('Failed to send password reset email: ${e.toString()}');
    }
  }

  @override
  Future<User?> getCurrentUser() async {
    try {
      // Check if user is logged in locally
      final isLoggedIn = await _localDataSource.isLoggedIn();
      if (!isLoggedIn) return null;

      // Get cached user data
      final user = await _localDataSource.getCachedUserData();

      // If we have network, verify token
      if (await _networkInfo.isConnected) {
        final token = await _localDataSource.getAuthToken();
        if (token != null) {
          try {
            await _remoteDataSource.verifyToken(token);
          } catch (e) {
            // Token is invalid, log out user
            await logout();
            return null;
          }
        }
      }

      return user;
    } catch (e) {
      return null;
    }
  }

  @override
  Stream<User?> get authStateChanges => _authStateController.stream;

  @override
  Future<User?> signInWithGoogle() async {
    if (!(await _networkInfo.isConnected)) {
      throw Failure('No internet connection');
    }

    try {
      // Get credentials from social auth service
      final credential = await SocialAuthService().signInWithGoogle();
      if (credential == null) return null;

      // Get user data from Firebase
      final firebaseUser = credential.user;
      if (firebaseUser == null) return null;

      try {
        // Check if user exists in our backend
        final existingUser = await _remoteDataSource.getUserByEmail(
          firebaseUser.email!,
        );
        if (existingUser != null) {
          await _localDataSource.cacheUserData(existingUser);
          _authStateController.add(existingUser);
          return existingUser;
        }

        // Create new user in backend
        final newUser = User(
          id: firebaseUser.uid,
          email: firebaseUser.email!,
          name: firebaseUser.displayName ?? '',
          userType: UserType.renter,
          isVerified: firebaseUser.emailVerified,
          createdAt: DateTime.now(),
          photoUrl: firebaseUser.photoURL,
        );

        final createdUser = await _remoteDataSource.createUser(newUser);
        await _localDataSource.cacheUserData(createdUser);
        _authStateController.add(createdUser);
        return createdUser;
      } catch (e) {
        throw Failure('Failed to create user profile');
      }
    } on FirebaseAuthException catch (e) {
      throw Failure(e.message ?? 'Google sign in failed');
    } catch (e) {
      throw Failure('Failed to sign in with Google');
    }
  }

  @override
  Future<User?> signInWithFacebook() async {
    if (!(await _networkInfo.isConnected)) {
      throw Failure('No internet connection');
    }

    try {
      final credential = await SocialAuthService().signInWithFacebook();
      if (credential == null) return null;

      final firebaseUser = credential.user;
      if (firebaseUser == null) return null;

      try {
        final existingUser = await _remoteDataSource.getUserByEmail(
          firebaseUser.email!,
        );
        if (existingUser != null) {
          await _localDataSource.cacheUserData(existingUser);
          _authStateController.add(existingUser);
          return existingUser;
        }

        final newUser = User(
          id: firebaseUser.uid,
          email: firebaseUser.email!,
          name: firebaseUser.displayName ?? '',
          userType: UserType.renter,
          isVerified: firebaseUser.emailVerified,
          createdAt: DateTime.now(),
          photoUrl: firebaseUser.photoURL,
        );

        final createdUser = await _remoteDataSource.createUser(newUser);
        await _localDataSource.cacheUserData(createdUser);
        _authStateController.add(createdUser);
        return createdUser;
      } catch (e) {
        throw Failure('Failed to create user profile');
      }
    } on FirebaseAuthException catch (e) {
      throw Failure(e.message ?? 'Facebook sign in failed');
    } catch (e) {
      throw Failure('Failed to sign in with Facebook');
    }
  }

  @override
  Future<User?> signInWithApple() async {
    if (!(await _networkInfo.isConnected)) {
      throw Failure('No internet connection');
    }

    try {
      final credential = await SocialAuthService().signInWithApple();
      if (credential == null) return null;

      final firebaseUser = credential.user;
      if (firebaseUser == null) return null;

      try {
        final existingUser = await _remoteDataSource.getUserByEmail(
          firebaseUser.email!,
        );
        if (existingUser != null) {
          await _localDataSource.cacheUserData(existingUser);
          _authStateController.add(existingUser);
          return existingUser;
        }

        final newUser = User(
          id: firebaseUser.uid,
          email: firebaseUser.email!,
          name: firebaseUser.displayName ?? '',
          userType: UserType.renter,
          isVerified: firebaseUser.emailVerified,
          createdAt: DateTime.now(),
          photoUrl: firebaseUser.photoURL,
        );

        final createdUser = await _remoteDataSource.createUser(newUser);
        await _localDataSource.cacheUserData(createdUser);
        _authStateController.add(createdUser);
        return createdUser;
      } catch (e) {
        throw Failure('Failed to create user profile');
      }
    } on FirebaseAuthException catch (e) {
      throw Failure(e.message ?? 'Apple sign in failed');
    } catch (e) {
      throw Failure('Failed to sign in with Apple');
    }
  }
}
