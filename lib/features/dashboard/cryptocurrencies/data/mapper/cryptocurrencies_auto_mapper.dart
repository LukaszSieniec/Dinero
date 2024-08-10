// ignore_for_file: depend_on_referenced_packages

import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/data/network/dto/cryptocurrency_response.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/domain/model/cryptocurrency.dart';

import 'cryptocurrencies_auto_mapper.auto_mappr.dart';

@AutoMappr(
  [
    MapType<CryptocurrencyResponse, Cryptocurrency>(
      fields: [
        Field(
          'sparklineIn7d',
          custom: CryptocurrenciesAutoMapper.sparklineIn7d,
        ),
      ],
    ),
  ],
)
class CryptocurrenciesAutoMapper extends $CryptocurrenciesAutoMapper {
  static List<double> sparklineIn7d(CryptocurrencyResponse response) =>
      response.sparklineIn7d.price;
}
