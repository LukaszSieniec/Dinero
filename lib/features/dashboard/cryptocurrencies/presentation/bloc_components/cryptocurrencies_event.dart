import 'package:freezed_annotation/freezed_annotation.dart';

part 'cryptocurrencies_event.freezed.dart';

@freezed
sealed class CryptocurrenciesEvent with _$CryptocurrenciesEvent {
  // The event is responsible for starting to listen
  // for changes related to the cryptocurrency list.
  const factory CryptocurrenciesEvent.observed() =
      ObservedCryptocurrenciesEvent;

  // The event is responsible for fetching all cryptocurrencies.
  const factory CryptocurrenciesEvent.fetched() = FetchedCryptocurrenciesEvent;
}
