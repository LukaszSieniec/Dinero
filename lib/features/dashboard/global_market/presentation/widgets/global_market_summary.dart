import 'package:dinero/common/presentation/design/app_palette.dart';
import 'package:dinero/common/presentation/widgets/app_label.dart';
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
      child: const Row(
        children: [
          GlobalMarketSummaryElement(
            label: 'Active Cryptocurrency',
            value: '13,6 k',
          ),
          GlobalMarketSummaryElement(
            label: 'Market Cap',
            value: '2,30 T',
          ),
          GlobalMarketSummaryElement(
            label: 'Volume',
            value: '90,45 B',
          ),
          GlobalMarketSummaryElement(
            label: 'Dominance',
            value: '55,73 %',
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
          ),
          SizedBox(height: 4.0.h),
          AppLabel(
            label: value,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontSize: 16.0.sp,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
