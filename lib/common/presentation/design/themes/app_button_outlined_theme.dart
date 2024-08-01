import 'package:dinero/common/presentation/design/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

OutlinedButtonThemeData get appOutlinedButtonTheme =>
    _buildAppOutlinedButtonTheme();

OutlinedButtonThemeData _buildAppOutlinedButtonTheme() =>
    OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppPalette.dark,
        disabledBackgroundColor: AppPalette.lightDark,
        side: const BorderSide(color: AppPalette.blue),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0.r),
        ),
      ),
    );
