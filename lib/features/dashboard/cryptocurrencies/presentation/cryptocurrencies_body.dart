import 'package:dinero/common/presentation/widgets/app_loading.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/presentation/bloc_components/cryptocurrencies_bloc.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/presentation/bloc_components/cryptocurrencies_state.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/presentation/widgets/cryptocurrency_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptocurrenciesBody extends StatelessWidget {
  const CryptocurrenciesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptocurrenciesBloc, CryptocurrenciesState>(
      builder: (context, state) {
        return state.status.maybeWhen(
          loading: () => const AppLoading(),
          success: () =>
              CryptocurrencyList(cryptocurrencies: state.cryptocurrencies),
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}
