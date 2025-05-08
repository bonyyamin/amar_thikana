import 'dart:async';
import 'dart:math';

import 'package:amar_thikana/domain/services/location_service_interface.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:uuid/uuid.dart';


class LocationService implements LocationServiceInterface {
  static final LocationService _instance = LocationService._internal();
  
  factory LocationService() {
    return _instance;
  }
  
  LocationService._internal();
  
  final Map<String, StreamSubscription<Position>> _subscriptions = {};
  final Uuid _uuid = const Uuid();
  
  @override
  Future<bool> initialize() async {
    try {
      // Nothing special needed for initialization
      return true;
    } catch (e) {
      debugPrint('Error initializing location service: $e');
      return false;
    }
  }
  
  @override
  Future<LocationServiceStatus> requestPermission() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      
      switch (permission) {
        case LocationPermission.denied:
          return LocationServiceStatus.permissionDenied;
        case LocationPermission.deniedForever:
          return LocationServiceStatus.permissionDeniedForever;
        case LocationPermission.whileInUse:
        case LocationPermission.always:
          bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
          return serviceEnabled
              ? LocationServiceStatus.permissionGranted
              : LocationServiceStatus.disabled;
        default:
          return LocationServiceStatus.permissionDenied;
      }
    } catch (e) {
      debugPrint('Error requesting location permission: $e');
      return LocationServiceStatus.permissionDenied;
    }
  }
  
  @override
  Future<LocationServiceStatus> checkPermission() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return LocationServiceStatus.disabled;
      }
      
      LocationPermission permission = await Geolocator.checkPermission();
      
      switch (permission) {
        case LocationPermission.denied:
          return LocationServiceStatus.permissionDenied;
        case LocationPermission.deniedForever:
          return LocationServiceStatus.permissionDeniedForever;
        case LocationPermission.whileInUse:
        case LocationPermission.always:
          return LocationServiceStatus.permissionGranted;
        default:
          return LocationServiceStatus.permissionDenied;
      }
    } catch (e) {
      debugPrint('Error checking location permission: $e');
      return LocationServiceStatus.permissionDenied;
    }
  }
  
  @override
  Future<LocationData> getCurrentLocation() async {
    try {
      final status = await checkPermission();
      if (status != LocationServiceStatus.permissionGranted) {
        throw Exception('Location permission not granted');
      }
      
      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      
      return _positionToLocationData(position);
    } catch (e) {
      debugPrint('Error getting current location: $e');
      rethrow;
    }
  }
  
  @override
  Future<String> startLocationUpdates({
    required Function(LocationData) onLocationChanged,
    double distanceFilter = 0.0,
  }) async {
    try {
      final status = await checkPermission();
      if (status != LocationServiceStatus.permissionGranted) {
        throw Exception('Location permission not granted');
      }
      
      // Generate a unique ID for this subscription
      final String subscriptionId = _uuid.v4();
      
      // Start listening for location updates
      final StreamSubscription<Position> subscription =
          Geolocator.getPositionStream(
            locationSettings: LocationSettings(
              accuracy: LocationAccuracy.high,
              distanceFilter: 12,
            ),
          ).listen((Position position) {
            final LocationData locationData = _positionToLocationData(position);
            onLocationChanged(locationData);
          });
      
      // Store the subscription
      _subscriptions[subscriptionId] = subscription;
      
      return subscriptionId;
    } catch (e) {
      debugPrint('Error starting location updates: $e');
      rethrow;
    }
  }
  
  @override
  Future<bool> stopLocationUpdates(String subscriptionId) async {
    try {
      final StreamSubscription<Position>? subscription =
          _subscriptions[subscriptionId];
      
      if (subscription != null) {
        await subscription.cancel();
        _subscriptions.remove(subscriptionId);
        return true;
      }
      
      return false;
    } catch (e) {
      debugPrint('Error stopping location updates: $e');
      return false;
    }
  }
  
  @override
  double calculateDistance(LocationData startLocation, LocationData endLocation) {
    try {
      return Geolocator.distanceBetween(
        startLocation.latitude,
        startLocation.longitude,
        endLocation.latitude,
        endLocation.longitude,
      );
    } catch (e) {
      debugPrint('Error calculating distance: $e');
      
      // Fallback calculation using haversine formula if Geolocator fails
      return _calculateHaversineDistance(
        startLocation.latitude,
        startLocation.longitude,
        endLocation.latitude,
        endLocation.longitude,
      );
    }
  }
  
  @override
  Future<LocationData?> getLastKnownLocation() async {
    try {
      final Position? position = await Geolocator.getLastKnownPosition();
      
      if (position != null) {
        return _positionToLocationData(position);
      }
      
      return null;
    } catch (e) {
      debugPrint('Error getting last known location: $e');
      return null;
    }
  }
  
  @override
  Future<bool> isLocationServiceEnabled() async {
    try {
      return await Geolocator.isLocationServiceEnabled();
    } catch (e) {
      debugPrint('Error checking if location service is enabled: $e');
      return false;
    }
  }
  
  // Helper method to convert Position to LocationData
  LocationData _positionToLocationData(Position position) {
    return LocationData(
      latitude: position.latitude,
      longitude: position.longitude,
      altitude: position.altitude,
      accuracy: position.accuracy,
      speed: position.speed,
      heading: position.heading,
      timestamp: DateTime.fromMillisecondsSinceEpoch(
        position.timestamp?.millisecondsSinceEpoch ?? 
        DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }
  
  // Fallback method to calculate distance using the haversine formula
  double _calculateHaversineDistance(
    double startLatitude,
    double startLongitude,
    double endLatitude,
    double endLongitude,
  ) {
    const int earthRadius = 6371000; // Earth radius in meters
    
    // Convert latitude and longitude from degrees to radians
    final double startLatRad = startLatitude * (pi / 180);
    final double endLatRad = endLatitude * (pi / 180);
    final double latDiffRad = (endLatitude - startLatitude) * (pi / 180);
    final double lngDiffRad = (endLongitude - startLongitude) * (pi / 180);
    
    // Haversine formula
    final double a = sin(latDiffRad / 2) * sin(latDiffRad / 2) +
        cos(startLatRad) * cos(endLatRad) *
        sin(lngDiffRad / 2) * sin(lngDiffRad / 2);
    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    
    return earthRadius * c;
  }
}