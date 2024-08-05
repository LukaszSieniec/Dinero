import 'package:dinero/features/dashboard/global_market/data/network/dto/market_cap_percentage_response.dart';
import 'package:dinero/features/dashboard/global_market/data/network/dto/total_value_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'global_market_content_response.freezed.dart';

part 'global_market_content_response.g.dart';

@freezed
class GlobalMarketContentResponse with _$GlobalMarketContentResponse {
  const factory GlobalMarketContentResponse({
    @JsonKey(name: 'active_cryptocurrencies')
    required int activeCryptocurrencies,
    @JsonKey(name: 'upcoming_icos') required int upcomingIcos,
    @JsonKey(name: 'ongoing_icos') required int ongoingIcos,
    @JsonKey(name: 'ended_icos') required int endedIcos,
    required int markets,
    @JsonKey(name: 'total_market_cap')
    required TotalValueResponse totalMarketCap,
    @JsonKey(name: 'total_volume') required TotalValueResponse totalVolume,
    @JsonKey(name: 'market_cap_percentage')
    required MarketCapPercentageResponse marketCapPercentage,
    @JsonKey(name: 'market_cap_change_percentage_24h_usd')
    required double marketCapChangePercentage24hUsd,
  }) = _GlobalMarketContentResponse;

  factory GlobalMarketContentResponse.fromJson(Map<String, Object?> json) =>
      _$GlobalMarketContentResponseFromJson(json);
}
