import 'package:dinero/common/presentation/design/app_palette.dart';
import 'package:dinero/common/presentation/widgets/app_label.dart';
import 'package:dinero/common/presentation/widgets/app_rounded_network_image.dart';
import 'package:dinero/common/utils/number_formatters/app_number_formatters.dart';
import 'package:dinero/core/di/dependency_injection.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/domain/model/cryptocurrency.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/presentation/bloc_components/cryptocurrencies_bloc.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/presentation/bloc_components/cryptocurrencies_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class CryptocurrencyList extends StatefulWidget {
  final List<Cryptocurrency> cryptocurrencies;

  const CryptocurrencyList({
    required this.cryptocurrencies,
    super.key,
  });

  @override
  State<CryptocurrencyList> createState() => _CryptocurrencyListState();
}

class _CryptocurrencyListState extends State<CryptocurrencyList> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _scrollController,
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      itemBuilder: (context, index) => CryptocurrencyListTile(
        cryptocurrency: widget.cryptocurrencies[index],
      ),
      separatorBuilder: (context, index) => SizedBox(height: 24.0.h),
      itemCount: widget.cryptocurrencies.length,
    );
  }

  void _onScrollListener() {
    if (!_scrollController.hasClients) {
      return;
    }

    final maxScrollExtent = _scrollController.position.maxScrollExtent;
    final currentScrollOffset = _scrollController.offset;

    if (currentScrollOffset >= (maxScrollExtent * 0.90)) {
      inject<CryptocurrenciesBloc>().add(const CryptocurrenciesEvent.fetched());
    }
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
              color: cryptocurrency.sparklineIn7d.last >
                      cryptocurrency.sparklineIn7d.first
                  ? AppPalette.green
                  : AppPalette.red,
              axisLineWidth: 0.0,
            ),
          ),
        ),
      ],
    );
  }
}
