import 'package:dinero/features/dashboard/cryptocurrencies/data/network/dto/cryptocurrencies_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'cryptocurrencies_api.g.dart';

@RestApi()
abstract class CryptocurrenciesApi {
  static const String cryptocurrenciesPath = '/coins/markets';

  factory CryptocurrenciesApi(Dio dio) = _CryptocurrenciesApi;

  @GET(cryptocurrenciesPath)
  Future<CryptocurrenciesResponse> fetchCryptocurrencies({
    @Query('vs_currency') required String vsCurrency,
    @Query('ids') required List<String> ids,
    @Query('category') String category,
    @Query('order') String order,
    @Query('per_page') int perPage,
    @Query('page') int page,
    @Query('sparkline') bool sparkline,
    @Query('price_change_percentage') String priceChangePercentage,
    @Query('locale') String locale,
    @Query('precision') String precision,
  });
}
