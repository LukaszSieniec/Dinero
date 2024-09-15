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
              isSelected: true,
              onTap: () {
                // Call event.
              },
            ),
          ),
          Expanded(
            child: CryptocurrencyHeaderItem(
              label: LocaleKeys.dashboard_price.tr(),
              isSelected: true,
              mainAxisAlignment: MainAxisAlignment.end,
              onTap: () {
                // Call event.
              },
            ),
          ),
          SizedBox(width: 32.0.w),
          Expanded(
            child: CryptocurrencyHeaderItem(
              label: LocaleKeys.dashboard_last7Days.tr(),
              isSelected: true,
              mainAxisAlignment: MainAxisAlignment.end,
              onTap: () {
                // Call event.
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CryptocurrencyHeaderItem extends StatelessWidget {
  final String label;

  final bool isSelected;

  final MainAxisAlignment mainAxisAlignment;

  // Allows you to sort cryptocurrencies according to the selected parameter.
  final VoidCallback? onTap;

  const CryptocurrencyHeaderItem({
    required this.label,
    this.isSelected = false,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          AppLabel(
            label: label,
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: AppPalette.textMediumGray),
          ),
          if (isSelected)
            const Icon(
              size: 16.0,
              Icons.arrow_drop_up_outlined,
            ),
        ],
      ),
    );
  }
}
