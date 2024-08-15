import 'package:dinero/common/presentation/widgets/app_header.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/presentation/widgets/cryptocurrency_list_header.dart';
import 'package:dinero/features/dashboard/global_market/presentation/widgets/global_market_summary.dart';
import 'package:dinero/features/dashboard/widgets/dashboard_tab_bar.dart';
import 'package:dinero/features/dashboard/widgets/dashboard_tab_bar_view.dart';
import 'package:dinero/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const int _length = 4;

class DashboardBody extends StatefulWidget {
  const DashboardBody({super.key});

  @override
  State<DashboardBody> createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody>
    with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: _length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
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
                  DashboardTabBar(tabController: tabController),
                  SizedBox(height: 16.0.h),
                  const CryptocurrencyListHeader(),
                ],
              ),
              pinned: true,
              toolbarHeight: kToolbarHeight + 40.0.h,
            ),
          ];
        },
        body: DashboardTabBarView(tabController: tabController),
      ),
    );
  }
}
