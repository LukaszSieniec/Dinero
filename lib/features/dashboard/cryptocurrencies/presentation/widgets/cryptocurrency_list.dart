import 'package:dinero/common/presentation/widgets/app_label.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/domain/model/cryptocurrency.dart';
import 'package:flutter/material.dart';

class CryptocurrencyList extends StatelessWidget {
  final List<Cryptocurrency> cryptocurrencies;

  const CryptocurrencyList({
    required this.cryptocurrencies,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    return AppLabel(
      label: cryptocurrency.name,
      style: Theme.of(context).textTheme.labelMedium!,
    );
  }
}
