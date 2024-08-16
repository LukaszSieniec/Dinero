import 'package:dinero/features/dashboard/cryptocurrencies/domain/model/cryptocurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cryptocurrencies_state.freezed.dart';

@freezed
class CryptocurrenciesState with _$CryptocurrenciesState {
  const factory CryptocurrenciesState({
    @Default([]) final List<Cryptocurrency> cryptocurrencies,
    @Default(0) final int pageIndex,
    @Default(false) final bool reachedMax,
    @Default(CryptocurrenciesStatus.loading())
    final CryptocurrenciesStatus status,
  }) = _CryptocurrenciesState;
}

@freezed
sealed class CryptocurrenciesStatus with _$CryptocurrenciesStatus {
  // The screen status that reflects the process of performing a specific operation.
  // Allows you to display a specific component.
  const factory CryptocurrenciesStatus.loading() = _CryptocurrenciesLoading;

  // The screen status that reflects the successful completion of all relevant operations.
  // Allows you to display the received data and all components on the screen.
  const factory CryptocurrenciesStatus.success() = _CryptocurrenciesSuccess;

  // The screen status that reflects an error while performing a specific operation.
  // Allows you to display a specific component or error message.
  const factory CryptocurrenciesStatus.failure() = _CryptocurrenciesFailure;
}
