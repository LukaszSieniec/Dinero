import 'package:dinero/common/utils/app_environment.dart';
import 'package:dinero/main_common.dart';

void main() =>
    initializeRunConfiguration(appEnvironment: AppEnvironment.prod());
