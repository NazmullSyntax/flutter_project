import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF1565C0);
  static const Color background = Color(0xFFF7F9FC);
  static const Color surface = Colors.white;
  static const Color text = Color(0xFF222222);
  static const Color hint = Color(0xFF9E9E9E);
  static const Color border = Color(0xFFE0E0E0);
  static const Color facebook = Color(0xFF1877F2);
  static const Color googleBorder = Color(0xFFDDDDDD);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
