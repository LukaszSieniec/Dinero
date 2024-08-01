import 'package:dinero/core/navigation/go_router.dart';
import 'package:dinero/features/splash/bloc_components/splash_bloc.dart';
import 'package:dinero/features/splash/bloc_components/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) => state.splashAction?.maybeWhen(
        navigateToDashboard: () => const DashboardRoute().go(context),
        orElse: () => null,
      ),
      builder: (context, state) {
        return const Scaffold(
          body: Center(
            child: Text('Splash Body.'),
          ),
        );
      },
    );
  }
}
