import 'package:dinero/features/dashboard/global_market/data/network/dto/global_market_content_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'global_market_response.freezed.dart';

part 'global_market_response.g.dart';

@freezed
class GlobalMarketResponse with _$GlobalMarketResponse {
  const factory GlobalMarketResponse({
    @JsonKey(name: 'date') required GlobalMarketContentResponse globalMarket,
  }) = _GlobalMarketResponse;

  factory GlobalMarketResponse.fromJson(Map<String, Object?> json) =>
      _$GlobalMarketResponseFromJson(json);
}
