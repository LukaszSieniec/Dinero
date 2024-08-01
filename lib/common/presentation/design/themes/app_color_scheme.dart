import 'package:dinero/common/presentation/design/app_palette.dart';
import 'package:flutter/material.dart';

ColorScheme get appColorScheme => _buildAppColorScheme();

ColorScheme _buildAppColorScheme() => const ColorScheme(
      brightness: Brightness.dark,

      // Primary.
      primary: AppPalette.mediumDark,
      onPrimary: AppPalette.white,

      // Secondary.
      secondary: AppPalette.lightDark,
      onSecondary: AppPalette.white,

      // Error.
      error: AppPalette.red,
      onError: AppPalette.white,

      // Surface.
      surface: AppPalette.dark,
      onSurface: AppPalette.white,
    );
