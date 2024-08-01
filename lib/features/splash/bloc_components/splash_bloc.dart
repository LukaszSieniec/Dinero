import 'package:dinero/features/splash/bloc_components/splash_event.dart';
import 'package:dinero/features/splash/bloc_components/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  static const int _splashDelay = 2;

  SplashBloc() : super(const SplashState()) {
    on<LoadedSplashEvent>(_onLoaded);
  }

  Future<void> _onLoaded(
    LoadedSplashEvent event,
    Emitter<SplashState> emit,
  ) async {
    await Future.delayed(const Duration(seconds: _splashDelay));

    emit(
      state.copyWith(splashAction: const SplashAction.navigateToDashboard()),
    );
  }
}
