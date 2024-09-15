import 'package:dinero/core/di/dependency_injection.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/presentation/bloc_components/cryptocurrencies_bloc.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/presentation/bloc_components/cryptocurrencies_event.dart';
import 'package:dinero/features/dashboard/global_market/presentation/bloc_components/global_market_bloc.dart';
import 'package:dinero/features/dashboard/global_market/presentation/bloc_components/global_market_event.dart';
import 'package:dinero/features/main_container_app/main_container_app_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MainContainerAppPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainContainerAppPage({
    required this.navigationShell,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => inject<GlobalMarketBloc>()
            ..add(const GlobalMarketEvent.fetched()),
        ),
        BlocProvider(
          create: (context) => inject<CryptocurrenciesBloc>()
            ..add(const CryptocurrenciesEvent.observed())
            ..add(const CryptocurrenciesEvent.fetched()),
        ),
      ],
      child: MainContainerAppBody(navigationShell: navigationShell),
    );
  }
}
