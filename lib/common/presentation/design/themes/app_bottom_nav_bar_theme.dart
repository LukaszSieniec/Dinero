import 'package:dinero/common/presentation/design/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

BottomNavigationBarThemeData get appBottomNavBarTheme =>
    _buildAppBottomNavBarTheme();

BottomNavigationBarThemeData _buildAppBottomNavBarTheme() =>
    BottomNavigationBarThemeData(
      backgroundColor: AppPalette.mediumDark,
      selectedItemColor: AppPalette.white,
      unselectedItemColor: AppPalette.white,
      selectedLabelStyle: TextStyle(
        fontSize: 14.0.sp,
        fontWeight: FontWeight.bold,
      ),
      type: BottomNavigationBarType.fixed,
    );
