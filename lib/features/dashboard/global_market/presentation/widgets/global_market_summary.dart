import 'package:dinero/common/presentation/design/app_palette.dart';
import 'package:dinero/common/presentation/widgets/app_label.dart';
import 'package:dinero/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalMarketSummary extends StatelessWidget {
  const GlobalMarketSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16.0.w,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 16.0.h,
        horizontal: 16.0.w,
      ),
      decoration: BoxDecoration(
        color: AppPalette.mediumDark,
        borderRadius: BorderRadius.all(
          Radius.circular(16.0.r),
        ),
      ),
      child: Row(
        children: [
          GlobalMarketSummaryElement(
            label: LocaleKeys.dashboard_activeCryptocurrencies.tr(),
            value: '13,6k',
          ),
          GlobalMarketSummaryElement(
            label: LocaleKeys.dashboard_marketCap.tr(),
            value: '2,30T',
          ),
          GlobalMarketSummaryElement(
            label: LocaleKeys.dashboard_volume.tr(),
            value: '90,45B',
          ),
          GlobalMarketSummaryElement(
            label: LocaleKeys.dashboard_dominance.tr(),
            value: '55,73%',
          ),
        ],
      ),
    );
  }
}

class GlobalMarketSummaryElement extends StatelessWidget {
  final String label;
  final String value;

  const GlobalMarketSummaryElement({
    required this.label,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          AppLabel(
            label: label,
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: AppPalette.textLightGray),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4.0.h),
          AppLabel(
            label: value,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
