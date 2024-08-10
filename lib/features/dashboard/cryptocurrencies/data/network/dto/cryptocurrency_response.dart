import 'package:freezed_annotation/freezed_annotation.dart';

part 'cryptocurrency_response.freezed.dart';

part 'cryptocurrency_response.g.dart';

@freezed
class CryptocurrencyResponse with _$CryptocurrencyResponse {
  const factory CryptocurrencyResponse({
    required String id,
    required String symbol,
    required String name,
    required String image,
    @JsonKey(name: 'current_price') required double currentPrice,
    @JsonKey(name: 'market_cap') required double marketCap,
    @JsonKey(name: 'market_cap_rank') required int marketCapRank,
    @JsonKey(name: 'fully_diluted_valuation')
    required int? fullyDilutedValuation,
    @JsonKey(name: 'total_volume') required int? totalVolume,
    @JsonKey(name: 'high_24h') required int? high24h,
    @JsonKey(name: 'low_24h') required int? low24h,
    @JsonKey(name: 'price_change_24h') required double? priceChange24h,
    @JsonKey(name: 'price_change_percentage_24h')
    required double? priceChangePercentage24h,
    @JsonKey(name: 'market_cap_change_24h') required int? marketCapChange24h,
    @JsonKey(name: 'market_cap_change_percentage_24h')
    required double? marketCapChangePercentage24h,
    @JsonKey(name: 'circulating_supply') required int? circulatingSupply,
    @JsonKey(name: 'total_supply') required int? totalSupply,
    @JsonKey(name: 'max_supply') required int? maxSupply,
    required int? ath,
    @JsonKey(name: 'ath_change_percentage')
    required double? athChangePercentage,
    @JsonKey(name: 'ath_date') required String? athDate,
    required double? atl,
    @JsonKey(name: 'atl_change_percentage')
    required double? atlChangePercentage,
    @JsonKey(name: 'atl_date') required String? atlDate,
    @JsonKey(name: 'last_updated') required String? lastUpdated,
  }) = _CryptocurrencyResponse;

  factory CryptocurrencyResponse.fromJson(Map<String, Object?> json) =>
      _$CryptocurrencyResponseFromJson(json);
}
