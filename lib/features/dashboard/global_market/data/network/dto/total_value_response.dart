import 'package:freezed_annotation/freezed_annotation.dart';

part 'total_value_response.freezed.dart';

part 'total_value_response.g.dart';

@freezed
class TotalValueResponse with _$TotalValueResponse {
  const factory TotalValueResponse({
    required double btc,
    required double eth,
    required double usd,
    required double eur,
    required double gbp,
  }) = _TotalValueResponse;

  factory TotalValueResponse.fromJson(Map<String, Object?> json) =>
      _$TotalValueResponseFromJson(json);
}
