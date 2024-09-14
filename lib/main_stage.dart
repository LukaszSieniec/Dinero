import 'package:dinero/core/config/app_environment.dart';
import 'package:dinero/main_common.dart';

void main() =>
    initializeRunConfiguration(appEnvironment: AppEnvironment.stage());
