import 'package:dinero/common/presentation/design/app_palette.dart';
import 'package:dinero/common/presentation/widgets/app_header.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/presentation/bloc_components/cryptocurrencies_bloc.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/presentation/bloc_components/cryptocurrencies_event.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/presentation/widgets/cryptocurrency_list_header.dart';
import 'package:dinero/features/dashboard/global_market/presentation/widgets/global_market_summary.dart';
import 'package:dinero/features/dashboard/widgets/dashboard_tab_bar.dart';
import 'package:dinero/features/dashboard/widgets/dashboard_tab_bar_view.dart';
import 'package:dinero/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const int _length = 4;

class DashboardBody extends StatefulWidget {
  const DashboardBody({super.key});

  @override
  State<DashboardBody> createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  // Allows you to access the InnerController.
  late final GlobalKey<NestedScrollViewState> _globalKey;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _length,
      vsync: this,
    );

    _globalKey = GlobalKey();

    // A method that allows specific code to be executed
    // after the rendering phase is completed.
    WidgetsBinding.instance.endOfFrame.then(
      (endOfFrameValue) {
        final innerController = _globalKey.currentState?.innerController;

        innerController?.addListener(
          () {
            if (!innerController.hasClients) return;

            final maxScrollExtent = innerController.position.maxScrollExtent;
            final currentScrollOffset = innerController.offset;

            if (currentScrollOffset >= (maxScrollExtent * 0.95)) {
              context
                  .read<CryptocurrenciesBloc>()
                  .add(const CryptocurrenciesEvent.fetched());
            }
          },
        );
      },
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
        key: _globalKey,
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
