import 'package:flutter/material.dart';

class HomeBottomNavigation extends StatelessWidget {
  const HomeBottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  final int selectedIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onTap,
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      elevation: 12,
      surfaceTintColor: Colors.white,
      height: 70,
      backgroundColor: Colors.white,
      shadowColor: Colors.black.withAlpha(20),
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_rounded), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.explore_rounded), label: 'Explore'),
        NavigationDestination(icon: Icon(Icons.calendar_month_rounded), label: 'Bookings'),
        NavigationDestination(icon: Icon(Icons.favorite_rounded), label: 'Favorites'),
        NavigationDestination(icon: Icon(Icons.person_rounded), label: 'Profile'),
      ],
    );
  }
}
