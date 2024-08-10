import 'package:dinero/core/di/dependency_injection.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/presentation/bloc_components/cryptocurrencies_bloc.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/presentation/bloc_components/cryptocurrencies_event.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/presentation/cryptocurrencies_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptocurrenciesPage extends StatelessWidget {
  const CryptocurrenciesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inject<CryptocurrenciesBloc>()
        ..add(const CryptocurrenciesEvent.fetched()),
      child: const CryptocurrenciesBody(),
    );
  }
}
