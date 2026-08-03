import 'package:flutter/material.dart';

/// Application Color Palette adhering strictly to the Dark Blue Theme requirements.
class AppColors {
  AppColors._();

  // Background Colors
  static const Color background = Color(0xFF0A0E1A);
  static const Color surface = Color(0xFF1E293B);
  static const Color surfaceLight = Color(0xFF334155);
  static const Color cardBg = Color(0xFF0F172A);

  // Accent & Brand Colors
  static const Color primary = Color(0xFF3B82F6);       // Vibrant Blue
  static const Color primaryLight = Color(0xFF60A5FA);  // Light Accent Blue
  static const Color primaryDark = Color(0xFF1D4ED8);   // Deep Blue
  static const Color secondary = Color(0xFF06B6D4);     // Cyan Accent
  static const Color accentGradientStart = Color(0xFF2563EB);
  static const Color accentGradientEnd = Color(0xFF06B6D4);

  // Neutral Colors
  static const Color textPrimary = Color(0xFFF8FAFC);   // White Tint
  static const Color textSecondary = Color(0xFF94A3B8); // Slate Gray
  static const Color textMuted = Color(0xFF64748B);     // Muted Gray
  static const Color divider = Color(0xFF1E293B);       // Border Divider

  // Interactive Glow & Animation Colors
  static const Color glowCyan = Color(0xFF22D3EE);
  static const Color glowBlue = Color(0xFF60A5FA);

  // Linear Gradient Presets
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [accentGradientStart, accentGradientEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGlowGradient = LinearGradient(
    colors: [Color(0xFF1E3A8A), Color(0xFF0F172A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient buttonGradient = LinearGradient(
    colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
