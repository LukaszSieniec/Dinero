import 'package:dinero/common/utils/result.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/data/network/dto/cryptocurrencies_response.dart';
import 'package:dio/dio.dart';

abstract class CryptocurrenciesRepository {
  /// The method allows you to fetch all cryptocurrencies.
  Future<Result<CryptocurrenciesResponse, DioException>> fetchCryptocurrencies({
    required String vsCurrency,
    required List<String> ids,
    String? category,
    String? order,
    int? perPage,
    int? page,
    bool? sparkline,
    String? priceChangePercentage,
    String? locale,
    String? precision,
  });
}
