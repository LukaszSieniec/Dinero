import 'package:dinero/features/dashboard/global_market/domain/repository/global_market_repository.dart';
import 'package:dinero/features/dashboard/global_market/presentation/bloc_components/global_market_event.dart';
import 'package:dinero/features/dashboard/global_market/presentation/bloc_components/global_market_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GlobalMarketBloc extends Bloc<GlobalMarketEvent, GlobalMarketState> {
  final GlobalMarketRepository _globalMarketRepository;

  GlobalMarketBloc(this._globalMarketRepository)
      : super(const GlobalMarketState()) {
    on<FetchedGlobalMarketEvent>(_onFetched);
  }

  Future<void> _onFetched(
    FetchedGlobalMarketEvent event,
    Emitter<GlobalMarketState> emit,
  ) async {
    final result = await _globalMarketRepository.fetchGlobalMarket();

    emit(
      result.when(
        success: (globalMarket) => state.copyWith(
          globalMarket: globalMarket,
          status: const GlobalMarketStatus.success(),
        ),
        failure: (error) =>
            state.copyWith(status: const GlobalMarketStatus.failure()),
      ),
    );
  }
}
