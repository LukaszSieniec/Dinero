import 'package:dinero/common/presentation/widgets/app_header.dart';
import 'package:dinero/features/dashboard/global_market/presentation/widgets/global_market_summary.dart';
import 'package:dinero/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppHeader(
          label: LocaleKeys.common_dashboard.tr(),
        ),
        SizedBox(height: 16.0.h),
        const GlobalMarketSummary(),
      ],
    );
  }
}
