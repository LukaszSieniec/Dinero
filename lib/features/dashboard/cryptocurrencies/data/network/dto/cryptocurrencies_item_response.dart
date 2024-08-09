import 'package:freezed_annotation/freezed_annotation.dart';

part 'cryptocurrencies_item_response.freezed.dart';

part 'cryptocurrencies_item_response.g.dart';

@freezed
class CryptocurrenciesItemResponse with _$CryptocurrenciesItemResponse {
  const factory CryptocurrenciesItemResponse({
    required String id,
    required String symbol,
    required String name,
    required String image,
    required int currentPrice,
    required int marketCap,
    required int marketCapRank,
    required int fullyDilutedValuation,
    required int totalVolume,
    required int high24h,
    required int low24h,
    required double priceChange24h,
    required double priceChangePercentage24h,
    required int marketCapChange24h,
    required double marketCapChangePercentage24h,
    required int circulatingSupply,
    required int totalSupply,
    required int maxSupply,
    required int ath,
    required double athChangePercentage,
    required String athDate,
    required double atl,
    required double atlChangePercentage,
    required String atlDate,
    required String lastUpdated,
  }) = _CryptocurrenciesItemResponse;

  factory CryptocurrenciesItemResponse.fromJson(Map<String, Object?> json) =>
      _$CryptocurrenciesItemResponseFromJson(json);
}
