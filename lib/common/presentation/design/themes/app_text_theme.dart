import 'package:dinero/common/assets/app_resources.dart';
import 'package:dinero/common/presentation/design/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextTheme get appTextTheme => _buildAppTextTheme();

TextTheme _buildAppTextTheme() => TextTheme(
      displayLarge: TextStyle(
        color: AppPalette.textWhite,
        fontSize: 57.0.sp,
        fontFamily: AppResources.appFamilyFont,
      ),
      displayMedium: TextStyle(
        color: AppPalette.textWhite,
        fontSize: 45.0.sp,
        fontFamily: AppResources.appFamilyFont,
      ),
      displaySmall: TextStyle(
        color: AppPalette.textWhite,
        fontSize: 36.0.sp,
        fontFamily: AppResources.appFamilyFont,
      ),
      headlineLarge: TextStyle(
        color: AppPalette.textWhite,
        fontSize: 32.0.sp,
        fontFamily: AppResources.appFamilyFont,
      ),
      headlineMedium: TextStyle(
        color: AppPalette.textWhite,
        fontSize: 28.0.sp,
        fontFamily: AppResources.appFamilyFont,
      ),
      headlineSmall: TextStyle(
        color: AppPalette.textWhite,
        fontSize: 24.0.sp,
        fontFamily: AppResources.appFamilyFont,
      ),
      titleLarge: TextStyle(
        color: AppPalette.textWhite,
        fontSize: 22.0.sp,
        fontFamily: AppResources.appFamilyFont,
      ),
      titleMedium: TextStyle(
        color: AppPalette.textWhite,
        fontSize: 16.0.sp,
        fontFamily: AppResources.appFamilyFont,
      ),
      titleSmall: TextStyle(
        color: AppPalette.textWhite,
        fontSize: 14.0.sp,
        fontFamily: AppResources.appFamilyFont,
      ),
      bodyLarge: TextStyle(
        color: AppPalette.textWhite,
        fontSize: 16.0.sp,
        fontFamily: AppResources.appFamilyFont,
      ),
      bodyMedium: TextStyle(
        color: AppPalette.textWhite,
        fontSize: 14.0.sp,
        fontFamily: AppResources.appFamilyFont,
      ),
      bodySmall: TextStyle(
        color: AppPalette.textWhite,
        fontSize: 12.0.sp,
        fontFamily: AppResources.appFamilyFont,
      ),
      labelLarge: TextStyle(
        color: AppPalette.textWhite,
        fontSize: 14.0.sp,
        fontFamily: AppResources.appFamilyFont,
      ),
      labelMedium: TextStyle(
        color: AppPalette.textWhite,
        fontSize: 12.0.sp,
        fontFamily: AppResources.appFamilyFont,
      ),
      labelSmall: TextStyle(
        color: AppPalette.textWhite,
        fontSize: 11.0.sp,
        fontFamily: AppResources.appFamilyFont,
      ),
    );
