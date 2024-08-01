import 'package:dinero/core/navigation/go_router.dart';
import 'package:dinero/core/navigation/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

@module
abstract class GoRouterModule {
  @LazySingleton()
  GoRouter get goRouter => GoRouter(
        navigatorKey: rootNavigatorKey,
        routes: $appRoutes,
        initialLocation: Routes.splash,
      );
}
