import 'package:freezed_annotation/freezed_annotation.dart';

part 'cryptocurrency.freezed.dart';

@freezed
class Cryptocurrency with _$Cryptocurrency {
  const factory Cryptocurrency({
    required String id,
    required String symbol,
    required String name,
    required String image,
    required int currentPrice,
    required int marketCap,
    required int marketCapRank,
  }) = _Cryptocurrency;
}
