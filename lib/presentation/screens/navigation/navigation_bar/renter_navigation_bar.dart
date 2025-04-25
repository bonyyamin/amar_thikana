import 'package:amar_thikana/core/theme/app_colors.dart';
import 'package:amar_thikana/presentation/screens/common/messages/messages_list_screen.dart';
import 'package:amar_thikana/presentation/screens/common/profile/profile_screen.dart';
import 'package:amar_thikana/presentation/screens/renter/favorites/favorites_screen.dart';
import 'package:amar_thikana/presentation/screens/renter/home/renter_home_screen.dart';
import 'package:flutter/material.dart';

class RenterNavigationBar extends StatefulWidget {
  const RenterNavigationBar({super.key});

  @override
  State<RenterNavigationBar> createState() => _RenterNavigationBarState();
}

class _RenterNavigationBarState extends State<RenterNavigationBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    RenterHomeScreen(),
    FavoritesScreen(),
    MessagesListScreen(),
    ProfileScreen(),
  ];

  final List<String> types = ["Home", "Favorites", "Messages", "Profile"];
  final List<String> icons = [
    "assets/icons/home.png",
    "assets/icons/favorite.png",
    "assets/icons/message.png",
    "assets/icons/person.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          selectedItemColor: AppColors.primary,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: List.generate(types.length, _buildNavItem),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(int index) {
    bool isSelected = _selectedIndex == index;
    return BottomNavigationBarItem(
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icons[index],
            width: 20,
            height: 20,
          ),
          const SizedBox(height: 8),
          if (isSelected)
            Text(
              types[index],
              style: TextStyle(
                color: AppColors.primaryLight,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
        ],
      ),
      label: '',
    );
  }
}
