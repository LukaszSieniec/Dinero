import 'package:dinero/core/utils/result.dart';
import 'package:dinero/features/dashboard/global_market/domain/model/global_market.dart';
import 'package:dio/dio.dart';

abstract class GlobalMarketRepository {
  /// The method allows you to fetch all relevant information
  /// related to the global cryptocurrency market.
  Future<Result<GlobalMarket, DioException>> fetchGlobalMarket();
}
