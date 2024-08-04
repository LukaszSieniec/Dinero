import 'package:dinero/common/utils/result.dart';
import 'package:dinero/features/dashboard/global_market/data/mapper/global_market_auto_mapper.dart';
import 'package:dinero/features/dashboard/global_market/data/network/global_market_api.dart';
import 'package:dinero/features/dashboard/global_market/domain/model/global_market.dart';
import 'package:dinero/features/dashboard/global_market/domain/repository/global_market_repository.dart';
import 'package:dio/dio.dart';

class RestApiGlobalMarketRepository implements GlobalMarketRepository {
  final GlobalMarketApi _globalMarketApi;
  final GlobalMarketAutoMapper _autoMapper;

  const RestApiGlobalMarketRepository(
    this._globalMarketApi,
    this._autoMapper,
  );

  @override
  Future<Result<GlobalMarket, DioException>> fetchGlobalMarket() async {
    try {
      final response = await _globalMarketApi.fetchGlobalMarket();

      final globalMarket = _autoMapper.convert(response);

      return Result.success(data: globalMarket);
    } on DioException catch (error) {
      return Result.failure(error: error);
    }
  }
}
