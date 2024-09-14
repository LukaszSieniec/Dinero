import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';

// Class used to log the called events and transition of a [Bloc] states.
class AppBlocObserver extends BlocObserver {
  static const String characters = '**********';

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);

    final message =
        '$characters An event triggered in ${bloc.runtimeType} - $event $characters';

    developer.log(message);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);

    final currentState =
        '$characters Current state of ${bloc.runtimeType} $characters\n'
        '${transition.currentState}';
    final nextState =
        '$characters Next state of ${bloc.runtimeType} $characters\n'
        '${transition.nextState}';

    developer.log(currentState);
    developer.log(nextState);
  }
}
