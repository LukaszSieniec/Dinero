import 'package:dinero/common/presentation/widgets/app_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppHeader extends StatelessWidget {
  final String label;

  const AppHeader({
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0.w,
        top: 16.0.h,
      ),
      child: AppLabel(
        label: label,
        style: Theme.of(context)
            .textTheme
            .headlineLarge!
            .copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}
