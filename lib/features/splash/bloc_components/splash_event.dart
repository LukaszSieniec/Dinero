import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_event.freezed.dart';

@freezed
sealed class SplashEvent with _$SplashEvent {
  // The event is responsible for triggering any calculations or processes
  // when the application starts.
  const factory SplashEvent.loaded() = LoadedSplashEvent;
}
