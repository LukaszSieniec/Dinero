import 'package:dinero/features/dashboard/cryptocurrencies/data/network/dto/cryptocurrencies_item_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cryptocurrencies_response.freezed.dart';

part 'cryptocurrencies_response.g.dart';

@freezed
class CryptocurrenciesResponse with _$CryptocurrenciesResponse {
  const factory CryptocurrenciesResponse({
    required List<CryptocurrenciesItemResponse> cryptocurrencies,
  }) = _CryptocurrenciesResponse;

  factory CryptocurrenciesResponse.fromJson(Map<String, Object?> json) =>
      _$CryptocurrenciesResponseFromJson(json);
}
