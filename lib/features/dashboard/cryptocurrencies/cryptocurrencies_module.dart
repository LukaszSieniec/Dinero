import 'package:dinero/core/di/dependency_injection.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/data/mapper/cryptocurrencies_auto_mapper.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/data/network/cryptocurrencies_api.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/data/repository/rest_api_cryptocurrencies_repository.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/domain/repository/cryptocurrencies_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class CryptocurrenciesModule {
  @LazySingleton(as: CryptocurrenciesRepository)
  RestApiCryptocurrenciesRepository get cryptocurrenciesRepository;

  @lazySingleton
  CryptocurrenciesAutoMapper get autoMapper => CryptocurrenciesAutoMapper();

  @lazySingleton
  CryptocurrenciesApi get cryptocurrenciesApi =>
      CryptocurrenciesApi(inject<Dio>());
}
