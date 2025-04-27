import 'package:amar_thikana/presentation/screens/common/profile/edit_profile_screen.dart';
import 'package:amar_thikana/presentation/screens/common/profile/widgets/profile_card.dart';
import 'package:amar_thikana/presentation/screens/common/profile/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/application/providers/user/user_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userProvider);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Account', style: TextStyle(color: Colors.black)),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: userState.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (msg) => Center(child: Text(msg)),
          loaded: (user) => Column(
            children: [
              ProfileCard(
                user: user,
                onEdit: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => EditProfileScreen(user: user)),
                  );
                },
              ),
              const SizedBox(height: 30),
              ProfileMenuItem(
                icon: Icons.settings,
                title: 'Settings',
                onTap: () {},
              ),
              ProfileMenuItem(
                icon: Icons.logout,
                title: 'Logout',
                onTap: () {
                  ref.read(userProvider.notifier).logout();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Logged out!')),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
