import 'package:dinero/core/di/dependency_injection.dart';
import 'package:dinero/features/dashboard/global_market/data/mapper/global_market_auto_mapper.dart';
import 'package:dinero/features/dashboard/global_market/data/network/global_market_api.dart';
import 'package:dinero/features/dashboard/global_market/data/repository/rest_api_global_market_repository.dart';
import 'package:dinero/features/dashboard/global_market/domain/repository/global_market_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class GlobalMarketModule {
  @LazySingleton(as: GlobalMarketRepository)
  RestApiGlobalMarketRepository get globalMarketRepository;

  @lazySingleton
  GlobalMarketAutoMapper get autoMapper => GlobalMarketAutoMapper();

  @lazySingleton
  GlobalMarketApi get globalMarketApi => GlobalMarketApi(inject<Dio>());
}
