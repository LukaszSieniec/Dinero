import 'package:dinero/features/dashboard/global_market/domain/model/global_market.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'global_market_state.freezed.dart';

@freezed
class GlobalMarketState with _$GlobalMarketState {
  const factory GlobalMarketState({
    final GlobalMarket? globalMarket,
    @Default(GlobalMarketStatus.loading()) final GlobalMarketStatus status,
  }) = _GlobalMarketState;
}

@freezed
sealed class GlobalMarketStatus with _$GlobalMarketStatus {
  // The screen status that reflects the process of performing a specific operation.
  // Allows you to display a specific component.
  const factory GlobalMarketStatus.loading() = _GlobalMarketLoading;

  // The screen status that reflects the successful completion of all relevant operations.
  // Allows you to display the received data and all components on the screen.
  const factory GlobalMarketStatus.success() = _GlobalMarketSuccess;

  // The screen status that reflects an error while performing a specific operation.
  // Allows you to display a specific component or error message.
  const factory GlobalMarketStatus.failure() = _GlobalMarketFailure;
}
