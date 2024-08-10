// ignore_for_file: depend_on_referenced_packages

import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/data/network/dto/cryptocurrencies_item_response.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/domain/model/cryptocurrency.dart';

import 'cryptocurrencies_auto_mapper.auto_mappr.dart';

@AutoMappr(
  [
    MapType<CryptocurrenciesItemResponse, Cryptocurrency>(),
  ],
)
class CryptocurrenciesAutoMapper extends $CryptocurrenciesAutoMapper {}
