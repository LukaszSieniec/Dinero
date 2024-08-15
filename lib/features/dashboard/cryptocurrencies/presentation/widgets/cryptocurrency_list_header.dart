import 'package:dinero/common/presentation/design/app_palette.dart';
import 'package:dinero/common/presentation/widgets/app_label.dart';
import 'package:flutter/material.dart';

class CryptocurrencyListHeader extends StatelessWidget {
  const CryptocurrencyListHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CryptocurrencyHeaderItem(
          label: 'Kapitalizacja rynkowa',
          onPressed: () {},
        ),
        CryptocurrencyHeaderItem(
          label: 'Cena',
          onPressed: () {},
        ),
        CryptocurrencyHeaderItem(
          label: '24h %',
          onPressed: () {},
        ),
      ],
    );
  }
}

class CryptocurrencyHeaderItem extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const CryptocurrencyHeaderItem({
    required this.label,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppLabel(
      label: label,
      style: Theme.of(context)
          .textTheme
          .labelSmall!
          .copyWith(color: AppPalette.textMediumGray),
    );
  }
}
