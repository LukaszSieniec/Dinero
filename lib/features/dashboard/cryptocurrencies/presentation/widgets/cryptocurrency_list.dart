import 'package:dinero/common/presentation/design/app_palette.dart';
import 'package:dinero/common/presentation/widgets/app_label.dart';
import 'package:dinero/common/presentation/widgets/app_rounded_network_image.dart';
import 'package:dinero/common/utils/number_formatters/app_number_formatters.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/domain/model/cryptocurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class CryptocurrencyList extends StatelessWidget {
  final List<Cryptocurrency> cryptocurrencies;

  const CryptocurrencyList({
    required this.cryptocurrencies,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      itemBuilder: (context, index) => CryptocurrencyListTile(
        cryptocurrency: cryptocurrencies[index],
      ),
      separatorBuilder: (context, index) => SizedBox(height: 24.0.h),
      itemCount: cryptocurrencies.length,
    );
  }
}

class CryptocurrencyListTile extends StatelessWidget {
  final Cryptocurrency cryptocurrency;

  const CryptocurrencyListTile({
    required this.cryptocurrency,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppLabel(
          label: '${cryptocurrency.marketCapRank}.',
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 16.0.w),
        Expanded(
          child: Row(
            children: [
              AppRoundedNetworkImage(imageUrl: cryptocurrency.image),
              SizedBox(width: 8.0.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppLabel(
                    label: cryptocurrency.symbol.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  AppLabel(
                    label: compactCurrencyFormat(cryptocurrency.marketCap),
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: AppPalette.textMediumGray,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppLabel(
                label: '\$${cryptocurrency.currentPrice}',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              AppLabel(
                label:
                    percentageFormat(cryptocurrency.priceChangePercentage24h),
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: cryptocurrency.priceChangePercentage24h > 0.0
                          ? AppPalette.green
                          : AppPalette.red,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
        SizedBox(width: 32.0.w),
        Expanded(
          child: SizedBox(
            height: 40.0.h,
            child: SfSparkLineChart(
              data: cryptocurrency.sparklineIn7d,
              color: AppPalette.green,
              axisLineWidth: 0.0,
            ),
          ),
        ),
      ],
    );
  }
}
