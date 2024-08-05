import 'package:dinero/common/presentation/design/app_palette.dart';
import 'package:dinero/common/presentation/widgets/app_label.dart';
import 'package:dinero/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const int _cryptocurrencies = 0;
const int _trending = 1;
const int _favourites = 2;
const int _exchanges = 3;

const int _length = 4;

class DashboardTabBar extends StatefulWidget {
  const DashboardTabBar({super.key});

  @override
  State<DashboardTabBar> createState() => _DashboardTabBarState();
}

class _DashboardTabBarState extends State<DashboardTabBar> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = _cryptocurrencies;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _length,
      child: TabBar(
        isScrollable: true,
        indicatorColor: AppPalette.white,
        indicatorWeight: 4.0,
        indicatorSize: TabBarIndicatorSize.label,
        tabAlignment: TabAlignment.center,
        onTap: (index) => setState(
          () => currentIndex = index,
        ),
        tabs: [
          TabBarItem(
            label: LocaleKeys.dashboard_cryptocurrencies.tr(),
            isSelected: currentIndex == _cryptocurrencies,
          ),
          TabBarItem(
            label: LocaleKeys.dashboard_trending.tr(),
            isSelected: currentIndex == _trending,
          ),
          TabBarItem(
            label: LocaleKeys.dashboard_favourites.tr(),
            isSelected: currentIndex == _favourites,
          ),
          TabBarItem(
            label: LocaleKeys.dashboard_exchanges.tr(),
            isSelected: currentIndex == _exchanges,
          ),
        ],
      ),
    );
  }
}

class TabBarItem extends StatelessWidget {
  final String label;

  // Provides information whether the current tab is active.
  final bool isSelected;

  const TabBarItem({
    required this.label,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 8.0.h,
          horizontal: 12.0.w,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppPalette.blue : AppPalette.mediumDark,
          borderRadius: BorderRadius.circular(8.0.r),
        ),
        child: AppLabel(
          label: label,
          style: Theme.of(context).textTheme.labelMedium!,
        ),
      ),
    );
  }
}
