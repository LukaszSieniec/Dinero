import 'package:freezed_annotation/freezed_annotation.dart';

part 'sparkline_response.freezed.dart';

part 'sparkline_response.g.dart';

@freezed
class SparklineResponse with _$SparklineResponse {
  const factory SparklineResponse({
    required List<double> price,
  }) = _SparklineResponse;

  factory SparklineResponse.fromJson(Map<String, Object?> json) =>
      _$SparklineResponseFromJson(json);
}
