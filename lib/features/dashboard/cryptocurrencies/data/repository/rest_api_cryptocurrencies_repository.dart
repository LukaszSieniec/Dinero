import 'package:dinero/common/utils/result.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/data/mapper/cryptocurrencies_auto_mapper.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/data/network/cryptocurrencies_api.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/data/network/dto/cryptocurrencies_item_response.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/domain/model/cryptocurrency.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/domain/repository/cryptocurrencies_repository.dart';
import 'package:dio/dio.dart';

class RestApiCryptocurrenciesRepository implements CryptocurrenciesRepository {
  final CryptocurrenciesApi _cryptocurrenciesApi;
  final CryptocurrenciesAutoMapper _autoMapper;

  const RestApiCryptocurrenciesRepository(
    this._cryptocurrenciesApi,
    this._autoMapper,
  );

  @override
  Future<Result<List<Cryptocurrency>, DioException>> fetchCryptocurrencies({
    required String vsCurrency,
    List<String>? ids,
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
        category: category,
        order: order,
        perPage: perPage,
        page: page,
        sparkline: sparkline,
        priceChangePercentage: priceChangePercentage,
        locale: locale,
        precision: precision,
      );

      final List<Cryptocurrency> cryptocurrencies = [];

      for (final item in response.cryptocurrencies) {
        final cryptocurrency = _autoMapper
            .convert<CryptocurrenciesItemResponse, Cryptocurrency>(item);

        cryptocurrencies.add(cryptocurrency);
      }

      return Result.success(data: cryptocurrencies);
    } on DioException catch (error) {
      return Result.failure(error: error);
    }
  }
}
