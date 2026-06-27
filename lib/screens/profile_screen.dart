import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/user_model.dart';
import 'package:flutter_application_2/services/auth_service.dart';
import 'package:flutter_application_2/utils/app_colors.dart';
import 'package:flutter_application_2/utils/app_text_styles.dart';
import 'package:flutter_application_2/widgets/bottom_navigation.dart';
import 'package:flutter_application_2/widgets/logout_button.dart';
import 'package:flutter_application_2/widgets/profile_header.dart';
import 'package:flutter_application_2/widgets/settings_tile.dart';
import 'package:flutter_application_2/widgets/stats_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final UserProfile _user = UserProfile.example;
  bool _darkMode = false;
  int _selectedNavIndex = 4;

  void _showLogoutDialog() {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text('Confirm Logout'),
          content: const Text('Are you sure you want to log out of DeshExplorer?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                final navigator = Navigator.of(this.context);
                await AuthService.signOut();
                if (!mounted) return;
                navigator.pushNamedAndRemoveUntil('/login', (_) => false);
              },
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
              child: const Text('Log Out'),
            ),
          ],
        );
      },
    );
  }

  void _showAboutDialog() {
    showAboutDialog(
      context: context,
      applicationName: 'DeshExplorer',
      applicationVersion: '2.1.0',
      applicationIcon: const Icon(Icons.explore_rounded, color: AppColors.primary, size: 40),
      children: const [
        Text('Smart Travel Guide & Trip Planner for Bangladesh.'),
      ],
    );
  }

  void _onNavigationSelected(int index) {
    if (_selectedNavIndex == index) return;
    setState(() => _selectedNavIndex = index);
    if (index == 1) {
      Navigator.of(context).maybePop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Profile', style: AppTextStyles.appBarTitle),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined, color: AppColors.text),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 16),
            ProfileHeader(user: _user, onEdit: () {}),
            const SizedBox(height: 24),
            Row(
              children: [
                StatsCard(count: _user.savedTrips, label: 'Saved Trips'),
                const SizedBox(width: 12),
                StatsCard(count: _user.favorites, label: 'Favorites'),
                const SizedBox(width: 12),
                StatsCard(count: _user.reviews, label: 'Reviews'),
              ],
            ),
            const SizedBox(height: 24),
            const Text('Account Settings', style: AppTextStyles.sectionTitle),
            const SizedBox(height: 18),
            SettingsTile(
              icon: Icons.notifications_none_rounded,
              title: 'Notification Preferences',
              onTap: () {},
            ),
            SettingsTile(
              icon: Icons.dark_mode_outlined,
              title: 'Dark Mode',
              subtitle: _darkMode ? 'Enabled' : 'Disabled',
              trailing: Switch(
                value: _darkMode,
                activeThumbColor: AppColors.primary,
                onChanged: (value) => setState(() => _darkMode = value),
              ),
              onTap: () => setState(() => _darkMode = !_darkMode),
            ),
            SettingsTile(
              icon: Icons.language_rounded,
              title: 'Language',
              subtitle: 'English',
              onTap: () {},
            ),
            SettingsTile(
              icon: Icons.lock_outline_rounded,
              title: 'Privacy & Security',
              onTap: () {},
            ),
            SettingsTile(
              icon: Icons.help_outline_rounded,
              title: 'Help & Support',
              onTap: () {},
            ),
            SettingsTile(
              icon: Icons.info_outline_rounded,
              title: 'About DeshExplorer',
              subtitle: 'Version 2.1.0',
              onTap: _showAboutDialog,
            ),
            const SizedBox(height: 24),
            LogoutButton(onPressed: _showLogoutDialog),
            const SizedBox(height: 90),
          ],
        ),
      ),
      bottomNavigationBar: HomeBottomNavigation(
        selectedIndex: _selectedNavIndex,
        onTap: _onNavigationSelected,
      ),
    );
  }
}
