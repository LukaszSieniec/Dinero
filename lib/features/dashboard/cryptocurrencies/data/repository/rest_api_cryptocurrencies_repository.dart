import 'package:dinero/common/utils/result.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/data/network/cryptocurrencies_api.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/data/network/dto/cryptocurrencies_response.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/domain/repository/cryptocurrencies_repository.dart';
import 'package:dio/dio.dart';

class RestApiCryptocurrenciesRepository implements CryptocurrenciesRepository {
  final CryptocurrenciesApi _cryptocurrenciesApi;

  const RestApiCryptocurrenciesRepository(
    this._cryptocurrenciesApi,
  );

  @override
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
  }) async {
    try {
      final response = await _cryptocurrenciesApi.fetchCryptocurrencies(
        vsCurrency: vsCurrency,
        ids: ids,
      );

      return Result.success(data: response);
    } on DioException catch (error) {
      return Result.failure(error: error);
    }
  }
}
