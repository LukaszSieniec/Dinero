import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState({
    final SplashAction? splashAction,
    @Default(SplashStatus.initial()) final SplashStatus status,
  }) = _SplashState;
}

@freezed
sealed class SplashStatus with _$SplashStatus {
  // The status of the screen that allows content to be displayed.
  const factory SplashStatus.initial() = _SplashInitial;
}

@freezed
sealed class SplashAction with _$SplashAction {
  // The action allows the current user to navigate to the dashboard.
  const factory SplashAction.navigateToDashboard() = _SplashNavigateToDashboard;
}
