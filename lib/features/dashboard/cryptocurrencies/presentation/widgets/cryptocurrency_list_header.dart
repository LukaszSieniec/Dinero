import 'package:dinero/common/presentation/design/app_palette.dart';
import 'package:dinero/common/presentation/widgets/app_label.dart';
import 'package:dinero/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CryptocurrencyListHeader extends StatelessWidget {
  const CryptocurrencyListHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Row(
        children: [
          const CryptocurrencyHeaderItem(label: '#'),
          SizedBox(width: 16.0.w),
          Expanded(
            child: CryptocurrencyHeaderItem(
              label: LocaleKeys.dashboard_capitalization.tr(),
              onTap: () {},
            ),
          ),
          Expanded(
            child: CryptocurrencyHeaderItem(
              label: LocaleKeys.dashboard_currentPrice.tr(),
              textAlign: TextAlign.end,
              onTap: () {},
            ),
          ),
          SizedBox(width: 32.0.w),
          Expanded(
            child: CryptocurrencyHeaderItem(
              label: LocaleKeys.dashboard_priceChange.tr(),
              textAlign: TextAlign.end,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class CryptocurrencyHeaderItem extends StatelessWidget {
  final String label;

  // The cryptocurrency parameter label position.
  final TextAlign? textAlign;

  // Allows you to sort cryptocurrencies according to the selected parameter.
  final VoidCallback? onTap;

  final bool isSelected;

  const CryptocurrencyHeaderItem({
    required this.label,
    this.textAlign,
    this.onTap,
    this.isSelected = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AppLabel(
        label: label,
        style: Theme.of(context)
            .textTheme
            .labelSmall!
            .copyWith(color: AppPalette.textMediumGray),
        textAlign: textAlign,
      ),
    );
  }
}
