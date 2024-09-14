import 'package:dinero/common/utils/result.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/domain/model/cryptocurrency.dart';
import 'package:dio/dio.dart';

abstract class CryptocurrenciesRepository {
  /// The getter that allows you to observe the list of cryptocurrencies.
  Stream<List<Cryptocurrency>> get observeCryptocurrencies;

  /// The method allows you to fetch all cryptocurrencies.
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
  });
}
