import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF1565C0);
  static const Color accent = Color(0xFFFF9800);
  static const Color background = Color(0xFFFFFFFF);
  static const Color card = Color(0xFFF8F9FA);
  static const Color text = Color(0xFF212121);
  static const Color subtitle = Color(0xFF757575);
  static const Color border = Color(0xFFE0E0E0);

  static const LinearGradient travelTipGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
  );
}
