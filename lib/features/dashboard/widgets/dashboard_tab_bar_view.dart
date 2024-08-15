import 'package:dinero/common/presentation/widgets/app_label.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/presentation/cryptocurrencies_page.dart';
import 'package:flutter/material.dart';

class DashboardTabBarView extends StatelessWidget {
  final TabController tabController;

  const DashboardTabBarView({
    required this.tabController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: [
        const CryptocurrenciesPage(),
        AppLabel(
          label: 'II',
          style: Theme.of(context).textTheme.titleLarge!,
          textAlign: TextAlign.center,
        ),
        AppLabel(
          label: 'III',
          style: Theme.of(context).textTheme.titleLarge!,
          textAlign: TextAlign.center,
        ),
        AppLabel(
          label: 'IV',
          style: Theme.of(context).textTheme.titleLarge!,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
