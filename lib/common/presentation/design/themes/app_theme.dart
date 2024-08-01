import 'package:dinero/common/presentation/design/themes/app_bottom_nav_bar_theme.dart';
import 'package:dinero/common/presentation/design/themes/app_button_elevated_theme.dart';
import 'package:dinero/common/presentation/design/themes/app_button_outlined_theme.dart';
import 'package:dinero/common/presentation/design/themes/app_color_scheme.dart';
import 'package:dinero/common/presentation/design/themes/app_text_theme.dart';
import 'package:flutter/material.dart';

ThemeData get appTheme => _buildAppTheme();

ThemeData _buildAppTheme() => ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: appColorScheme,
      textTheme: appTextTheme,
      bottomNavigationBarTheme: appBottomNavBarTheme,
      elevatedButtonTheme: appElevatedButtonTheme,
      outlinedButtonTheme: appOutlinedButtonTheme,
    );
