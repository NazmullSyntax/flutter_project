import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/colors.dart';
import 'package:flutter_application_2/utils/text_styles.dart';

enum SocialButtonType { google, facebook }

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.label,
    required this.type,
    required this.onPressed,
  });

  final String label;
  final SocialButtonType type;
  final VoidCallback onPressed;

  bool get _isFacebook => type == SocialButtonType.facebook;

  Color get _backgroundColor => _isFacebook ? AppColors.facebook : Colors.white;
  Color get _foregroundColor => _isFacebook ? Colors.white : AppColors.text;
  Color get _borderColor => _isFacebook ? Colors.transparent : AppColors.googleBorder;
  IconData get _iconData => _isFacebook ? Icons.facebook : Icons.g_mobiledata;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: _backgroundColor,
          foregroundColor: _foregroundColor,
          side: BorderSide(color: _borderColor, width: 1.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(_iconData, size: 20),
            const SizedBox(width: 12),
            Text(label, style: AppTextStyles.label.copyWith(color: _foregroundColor)),
          ],
        ),
      ),
    );
  }
}
