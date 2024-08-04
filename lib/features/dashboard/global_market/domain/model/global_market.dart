import 'package:freezed_annotation/freezed_annotation.dart';

part 'global_market.freezed.dart';

@freezed
class GlobalMarket with _$GlobalMarket {
  const factory GlobalMarket({
    required int activeCryptocurrencies,
    required double totalMarketCapUsd,
    required double totalVolumeUsd,
    required double btcDominance,
  }) = _GlobalMarket;
}
