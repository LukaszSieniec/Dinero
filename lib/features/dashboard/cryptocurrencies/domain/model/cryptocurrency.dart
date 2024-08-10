import 'package:freezed_annotation/freezed_annotation.dart';

part 'cryptocurrency.freezed.dart';

@freezed
class Cryptocurrency with _$Cryptocurrency {
  const factory Cryptocurrency({
    required String id,
    required String symbol,
    required String name,
    required String image,
    required double currentPrice,
    required double marketCap,
    required int marketCapRank,
  }) = _Cryptocurrency;
}
