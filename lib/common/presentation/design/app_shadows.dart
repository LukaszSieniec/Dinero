import 'package:dinero/common/presentation/design/app_palette.dart';
import 'package:flutter/material.dart';

abstract class AppShadows {
  static const BoxShadow bottomNavBarShadow = BoxShadow(
    color: AppPalette.white,
    offset: Offset(
      0.0,
      5.0,
    ),
    blurRadius: 15.0,
  );
}
