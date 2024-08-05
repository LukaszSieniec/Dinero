import 'package:dinero/core/di/dependency_injection.dart';
import 'package:dinero/features/dashboard/dashboard_body.dart';
import 'package:dinero/features/dashboard/global_market/presentation/bloc_components/global_market_bloc.dart';
import 'package:dinero/features/dashboard/global_market/presentation/bloc_components/global_market_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => inject<GlobalMarketBloc>()
            ..add(const GlobalMarketEvent.fetched()),
        ),
      ],
      child: const DashboardBody(),
    );
  }
}
