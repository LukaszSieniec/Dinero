import 'package:dinero/features/dashboard/global_market/domain/model/total_value.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'global_market.freezed.dart';

@freezed
class GlobalMarket with _$GlobalMarket {
  const factory GlobalMarket({
    required int activeCryptocurrencies,
    required TotalValue totalMarketCap,
    required TotalValue totalVolume,
    required double btcDominance,
  }) = _GlobalMarket;
}
