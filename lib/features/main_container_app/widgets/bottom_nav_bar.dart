import 'package:dinero/common/presentation/design/app_shadows.dart';
import 'package:dinero/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const BottomNavBar({
    required this.navigationShell,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32.0.r),
        ),
        boxShadow: const [
          AppShadows.bottomNavBarShadow,
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32.0.r),
        ),
        child: BottomNavigationBar(
          items: [
            _buildNavBarItem(
              label: LocaleKeys.common_dashboard.tr(),
              assetName: Icons.home_outlined,
            ),
            _buildNavBarItem(
              label: LocaleKeys.common_wallet.tr(),
              assetName: Icons.wallet_outlined,
            ),
            _buildNavBarItem(
              label: LocaleKeys.common_transactions.tr(),
              assetName: Icons.account_balance_outlined,
            ),
            _buildNavBarItem(
              label: LocaleKeys.common_profile.tr(),
              assetName: Icons.settings_outlined,
            ),
          ],
          onTap: navigationShell.goBranch,
          currentIndex: navigationShell.currentIndex,
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavBarItem({
    required String label,
    required IconData assetName,
  }) =>
      BottomNavigationBarItem(
        label: label,
        icon: Padding(
          padding: EdgeInsets.symmetric(vertical: 6.0.h),
          child: Icon(assetName),
        ),
      );
}
