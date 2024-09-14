import 'package:dinero/core/di/dependency_injection.config.dart';
import 'package:dinero/core/utils/app_environment.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@injectableInit
void configureDependencies({
  required AppEnvironment environment,
}) {
  getIt.registerSingleton<AppEnvironment>(environment);
  getIt.init();
}

T inject<T extends Object>({
  String? instanceName,
  dynamic param1,
  dynamic param2,
  Type? type,
}) =>
    getIt.get<T>(
      instanceName: instanceName,
      param1: param1,
      param2: param2,
      type: type,
    );
