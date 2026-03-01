import 'package:flutter/material.dart';

class AppColors {
  // Primary Brand Colors
  static const Color primary = Color(0xFFC67C4E); // Main accent color
  static const Color secondary = Color(0xFFEDD6C8); // Muted secondary accent

  // Background and Surfaces
  static const Color background = Color(0xFFF9F2ED); // Light app background
  static const Color surface = Color(
    0xFFFFFFFF,
  ); // Keep surfaces white for contrast against background

  // Grey/Neutral tones
  static const Color darkGray = Color(0xFF313131); // Dark text and elements
  static const Color lightGray = Color(0xFFE3E3E3); // Dividers and borders

  // Text Colors
  static const Color textPrimary = Color(
    0xFF313131,
  ); // Use darkGray for primary text
  static const Color textSecondary = Color(
    0xFFA2A2A2,
  ); // Example supplementary color

  // States and accents
  static const Color starRating = Color(0xFFC67C4E); // Same as primary
  static const Color error = Color(0xFFE53935);
  static const Color transparent = Colors.transparent;
}
