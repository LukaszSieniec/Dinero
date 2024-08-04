import 'package:freezed_annotation/freezed_annotation.dart';

part 'total_value.freezed.dart';

@freezed
class TotalValue with _$TotalValue {
  const factory TotalValue({
    required double btc,
    required double eth,
    required double usd,
    required double eur,
    required double gbp,
  }) = _TotalValue;
}
