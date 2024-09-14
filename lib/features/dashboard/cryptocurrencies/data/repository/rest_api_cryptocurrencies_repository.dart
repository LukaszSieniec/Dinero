import 'package:dinero/core/utils/result.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/data/mapper/cryptocurrencies_auto_mapper.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/data/network/cryptocurrencies_api.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/data/network/dto/cryptocurrency_response.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/domain/model/cryptocurrency.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/domain/repository/cryptocurrencies_repository.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

class RestApiCryptocurrenciesRepository implements CryptocurrenciesRepository {
  final CryptocurrenciesApi _cryptocurrenciesApi;
  final CryptocurrenciesAutoMapper _autoMapper;

  final BehaviorSubject<List<Cryptocurrency>> _cryptocurrenciesController;

  RestApiCryptocurrenciesRepository(
    this._cryptocurrenciesApi,
    this._autoMapper,
  ) : _cryptocurrenciesController = BehaviorSubject();

  @override
  Stream<List<Cryptocurrency>> get observeCryptocurrencies =>
      _cryptocurrenciesController.stream;

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

      final List<Cryptocurrency> cryptocurrencies = List.from(
        response.map(
          (cryptocurrency) => _autoMapper
              .convert<CryptocurrencyResponse, Cryptocurrency>(cryptocurrency),
        ),
      );

      _cryptocurrenciesController.add(
        [
          if (_cryptocurrenciesController.hasValue)
            ..._cryptocurrenciesController.value,
          ...cryptocurrencies,
        ],
      );

      return Result.success(data: cryptocurrencies);
    } on DioException catch (error) {
      return Result.failure(error: error);
    }
  }
}
