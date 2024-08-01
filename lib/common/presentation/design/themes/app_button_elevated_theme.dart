import 'package:dinero/common/presentation/design/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ElevatedButtonThemeData get appElevatedButtonTheme =>
    _buildAppElevatedButtonTheme();

ElevatedButtonThemeData _buildAppElevatedButtonTheme() =>
    ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppPalette.blue,
        disabledBackgroundColor: AppPalette.lightDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0.r),
        ),
      ),
    );
