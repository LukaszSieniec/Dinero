import 'package:dinero/common/utils/result.dart';
import 'package:dinero/features/dashboard/global_market/data/network/dto/global_market_response.dart';
import 'package:dinero/features/dashboard/global_market/data/network/global_market_api.dart';
import 'package:dinero/features/dashboard/global_market/domain/repository/global_market_repository.dart';
import 'package:dio/dio.dart';

class RestApiGlobalMarketRepository implements GlobalMarketRepository {
  final GlobalMarketApi _globalMarketApi;

  const RestApiGlobalMarketRepository(this._globalMarketApi);

  @override
  Future<Result<GlobalMarketResponse, DioException>> fetchGlobalMarket() async {
    try {
      final response = await _globalMarketApi.fetchGlobalMarket();

      return Result.success(data: response);
    } on DioException catch (error) {
      return Result.failure(error: error);
    }
  }
}
