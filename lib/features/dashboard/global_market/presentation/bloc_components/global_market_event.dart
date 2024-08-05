import 'package:freezed_annotation/freezed_annotation.dart';

part 'global_market_event.freezed.dart';

@freezed
sealed class GlobalMarketEvent with _$GlobalMarketEvent {
  // The event is responsible for fetching all relevant information
  // related to the global cryptocurrency market.
  const factory GlobalMarketEvent.fetched() = FetchedGlobalMarketEvent;
}
