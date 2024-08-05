import 'package:dinero/core/di/dependency_injection.dart';
import 'package:dinero/features/splash/presentation/bloc_components/splash_bloc.dart';
import 'package:dinero/features/splash/presentation/bloc_components/splash_event.dart';
import 'package:dinero/features/splash/presentation/splash_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (context) =>
          inject<SplashBloc>()..add(const SplashEvent.loaded()),
      child: const SplashBody(),
    );
  }
}
