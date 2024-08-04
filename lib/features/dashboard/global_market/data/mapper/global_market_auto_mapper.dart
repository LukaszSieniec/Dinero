// ignore_for_file: depend_on_referenced_packages

import 'package:dinero/features/dashboard/global_market/data/network/dto/global_market_content_response.dart';
import 'package:dinero/features/dashboard/global_market/data/network/dto/total_value_response.dart';
import 'package:dinero/features/dashboard/global_market/domain/model/global_market.dart';
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:dinero/features/dashboard/global_market/domain/model/total_value.dart';

import 'global_market_auto_mapper.auto_mappr.dart';

@AutoMappr(
  [
    MapType<GlobalMarketContentResponse, GlobalMarket>(
      fields: [
        Field(
          'btcDominance',
          custom: GlobalMarketAutoMapper.btcDominance,
        ),
      ],
    ),
    MapType<TotalValueResponse, TotalValue>(),
  ],
)
class GlobalMarketAutoMapper extends $GlobalMarketAutoMapper {
  static double btcDominance(GlobalMarketContentResponse response) =>
      response.marketCapPercentage.btc;
}
