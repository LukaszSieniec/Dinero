import 'package:dinero/common/utils/result.dart';
import 'package:dinero/features/dashboard/global_market/data/network/dto/global_market_response.dart';
import 'package:dio/dio.dart';

abstract class GlobalMarketRepository {
  /// The method allows you to fetch all relevant information
  /// related to the global cryptocurrency market.
  Future<Result<GlobalMarketResponse, DioException>> fetchGlobalMarket();
}
