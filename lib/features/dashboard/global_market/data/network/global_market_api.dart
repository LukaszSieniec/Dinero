import 'package:dinero/features/dashboard/global_market/data/network/dto/global_market_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'global_market_api.g.dart';

@RestApi()
abstract class GlobalMarketApi {
  static const String globalMarketPath = '/global';

  factory GlobalMarketApi(Dio dio) = _GlobalMarketApi;

  @GET(globalMarketPath)
  Future<GlobalMarketResponse> fetchGlobalMarket();
}
