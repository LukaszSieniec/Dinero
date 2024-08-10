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
    required double? currentPrice,
    required double? marketCap,
    required int? marketCapRank,
    required int? fullyDilutedValuation,
    required int? totalVolume,
    required int? high24h,
    required int? low24h,
    required double? priceChange24h,
    required double? priceChangePercentage24h,
    required int? marketCapChange24h,
    required double? marketCapChangePercentage24h,
    required int? circulatingSupply,
    required int? totalSupply,
    required int? maxSupply,
    required int? ath,
    required double? athChangePercentage,
    required String? athDate,
    required double? atl,
    required double? atlChangePercentage,
    required String? atlDate,
    required String? lastUpdated,
  }) = _CryptocurrencyResponse;

  factory CryptocurrencyResponse.fromJson(Map<String, Object?> json) =>
      _$CryptocurrencyResponseFromJson(json);
}
