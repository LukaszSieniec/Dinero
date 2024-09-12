import 'package:dinero/common/presentation/design/app_palette.dart';
import 'package:dinero/common/presentation/widgets/app_header.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/presentation/widgets/cryptocurrency_list_header.dart';
import 'package:dinero/features/dashboard/global_market/presentation/widgets/global_market_summary.dart';
import 'package:dinero/features/dashboard/widgets/dashboard_tab_bar.dart';
import 'package:dinero/features/dashboard/widgets/dashboard_tab_bar_view.dart';
import 'package:dinero/features/main_container_app/main_container_app_body.dart';
import 'package:dinero/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const int _length = 4;

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        key: nestedScrollViewGlobalKey,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: AppHeader(
                label: LocaleKeys.common_dashboard.tr(),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 16.0.h),
            ),
            const SliverToBoxAdapter(
              child: GlobalMarketSummary(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 16.0.h),
            ),
            SliverAppBar(
              flexibleSpace: Column(
                children: [
                  DashboardTabBar(tabController: _tabController),
                  SizedBox(height: 16.0.h),
                  const CryptocurrencyListHeader(),
                ],
              ),
              shadowColor: AppPalette.gray,
              pinned: true,
              toolbarHeight: kToolbarHeight + 40.0.h,
            ),
          ];
        },
        body: DashboardTabBarView(tabController: _tabController),
      ),
    );
  }
}
