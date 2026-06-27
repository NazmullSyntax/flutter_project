import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/app_colors.dart';
import 'package:flutter_application_2/utils/app_text_styles.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        leading: Icon(icon, color: AppColors.primary),
        title: Text(title, style: AppTextStyles.label.copyWith(color: AppColors.text)),
        subtitle: subtitle != null ? Text(subtitle!, style: AppTextStyles.subtitle) : null,
        trailing: trailing ?? const Icon(Icons.arrow_forward_ios_rounded, color: AppColors.subtitle, size: 18),
      ),
    );
  }
}
