import 'package:freezed_annotation/freezed_annotation.dart';

part 'market_cap_percentage_response.freezed.dart';

part 'market_cap_percentage_response.g.dart';

@freezed
class MarketCapPercentageResponse with _$MarketCapPercentageResponse {
  const factory MarketCapPercentageResponse({
    required double btc,
    required double eth,
  }) = _MarketCapPercentageResponse;

  factory MarketCapPercentageResponse.fromJson(Map<String, Object?> json) =>
      _$MarketCapPercentageResponseFromJson(json);
}
