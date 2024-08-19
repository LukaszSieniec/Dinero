import 'package:dinero/common/utils/bloc/app_event_transformers.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/domain/repository/cryptocurrencies_repository.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/presentation/bloc_components/cryptocurrencies_event.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/presentation/bloc_components/cryptocurrencies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CryptocurrenciesBloc
    extends Bloc<CryptocurrenciesEvent, CryptocurrenciesState> {
  static const Duration _throttleDuration = Duration(milliseconds: 100);
  static const int _cryptocurrenciesPerPage = 100;

  final CryptocurrenciesRepository _cryptocurrenciesRepository;

  CryptocurrenciesBloc(this._cryptocurrenciesRepository)
      : super(const CryptocurrenciesState()) {
    on<FetchedCryptocurrenciesEvent>(
      _onFetched,
      transformer: throttleDroppable(_throttleDuration),
    );
  }

  Future<void> _onFetched(
    FetchedCryptocurrenciesEvent event,
    Emitter<CryptocurrenciesState> emit,
  ) async {
    if (state.reachedMax) return;

    final result = await _cryptocurrenciesRepository.fetchCryptocurrencies(
      vsCurrency: 'usd',
      perPage: _cryptocurrenciesPerPage,
      page: state.pageIndex,
      sparkline: true,
    );

    emit(
      result.when(
        success: (cryptocurrencies) => state.copyWith(
          cryptocurrencies: cryptocurrencies ?? [],
          pageIndex: state.pageIndex + 1,
          status: const CryptocurrenciesStatus.success(),
        ),
        failure: (error) =>
            state.copyWith(status: const CryptocurrenciesStatus.failure()),
      ),
    );
  }
}
