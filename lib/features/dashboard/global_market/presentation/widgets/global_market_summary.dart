import 'package:dinero/common/presentation/design/app_palette.dart';
import 'package:dinero/common/presentation/widgets/app_label.dart';
import 'package:dinero/core/utils/number_formatters/app_number_formatters.dart';
import 'package:dinero/features/dashboard/global_market/presentation/bloc_components/global_market_bloc.dart';
import 'package:dinero/features/dashboard/global_market/presentation/bloc_components/global_market_state.dart';
import 'package:dinero/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalMarketSummary extends StatelessWidget {
  const GlobalMarketSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalMarketBloc, GlobalMarketState>(
      builder: (context, state) {
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
                value:
                    compactFormat(state.globalMarket?.activeCryptocurrencies),
              ),
              GlobalMarketSummaryElement(
                label: LocaleKeys.dashboard_marketCap.tr(),
                value: compactCurrencyFormat(
                  state.globalMarket?.totalMarketCap.usd,
                ),
              ),
              GlobalMarketSummaryElement(
                label: LocaleKeys.dashboard_volume.tr(),
                value:
                    compactCurrencyFormat(state.globalMarket?.totalVolume.usd),
              ),
              GlobalMarketSummaryElement(
                label: LocaleKeys.dashboard_dominance.tr(),
                value: percentageFormat(state.globalMarket?.btcDominance),
              ),
            ],
          ),
        );
      },
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
                .copyWith(color: AppPalette.textMediumGray),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4.0.h),
          AppLabel(
            label: value,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
