import 'package:dinero/common/presentation/design/app_palette.dart';
import 'package:dinero/common/presentation/widgets/app_label.dart';
import 'package:dinero/common/utils/number_formatters/app_number_formatters.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/domain/model/cryptocurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CryptocurrencyList extends StatelessWidget {
  final List<Cryptocurrency> cryptocurrencies;

  const CryptocurrencyList({
    required this.cryptocurrencies,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      itemBuilder: (context, index) => CryptocurrencyListTile(
        cryptocurrency: cryptocurrencies[index],
      ),
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
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: AppPalette.textMediumGray),
            ),
          ],
        ),
      ],
    );
  }
}
