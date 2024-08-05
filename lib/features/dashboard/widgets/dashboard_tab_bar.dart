import 'package:dinero/common/presentation/design/app_palette.dart';
import 'package:dinero/common/presentation/widgets/app_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const int _length = 4;

class DashboardTabBar extends StatefulWidget {
  const DashboardTabBar({super.key});

  @override
  State<DashboardTabBar> createState() => _DashboardTabBarState();
}

class _DashboardTabBarState extends State<DashboardTabBar> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _length,
      child: TabBar(
        isScrollable: true,
        indicatorColor: Colors.blue,
        indicatorWeight: 4.0,
        indicatorSize: TabBarIndicatorSize.label,
        onTap: (index) => setState(() => currentIndex = index),
        tabs: [
          TabBarItem(label: 'Cryptocurrencies', isSelected: currentIndex == 0),
          TabBarItem(label: 'Trending', isSelected: currentIndex == 1),
          TabBarItem(label: 'Favourites', isSelected: currentIndex == 2),
          TabBarItem(label: 'Exchanges', isSelected: currentIndex == 3),
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
