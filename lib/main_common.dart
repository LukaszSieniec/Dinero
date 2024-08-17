import 'package:dinero/common/assets/app_internalization.dart';
import 'package:dinero/common/presentation/design/themes/app_theme.dart';
import 'package:dinero/common/utils/bloc/app_bloc_observer.dart';
import 'package:dinero/common/utils/app_environment.dart';
import 'package:dinero/core/di/dependency_injection.dart';
import 'package:dinero/core/persistence/secure_storage.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

Future<void> initializeRunConfiguration({
  required AppEnvironment appEnvironment,
}) async {
  // Before running the application, make sure to run the native code.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase based on your environment.
  switch (appEnvironment.environment) {
    case Environment.dev:
      break;
    case Environment.stage:
      break;
    case Environment.prod:
      break;
  }

  // Allows you to use the application only in portrait mode.
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  // Must be called in main so that saved locales can be loaded and used.
  await EasyLocalization.ensureInitialized();

  // Initialize and configure the Service Locator.
  configureDependencies(environment: appEnvironment);

  // Initialize Secure Keys persistence.
  await inject<SecureStorage>().initialize();

  // A constant that is true if the application was compiled in debug mode.
  if (kDebugMode) {
    // Add a custom observer to support Bloc logs.
    // Used only in debug mode to avoid performance issues.
    Bloc.observer = AppBlocObserver();
  }

  runApplication();
}

void runApplication() => runApp(
      ScreenUtilInit(
        // Properties of iPhone 11 Pro Max.
        designSize: const Size(
          414.0,
          896.0,
        ),
        // This parameter specifies whether the library
        // should scale the text size depending on the screen size.
        minTextAdapt: true,
        child: EasyLocalization(
          supportedLocales: const [
            Locale(AppInternalization.languageCodePolish),
            Locale(AppInternalization.languageCodeEnglish),
          ],
          path: AppInternalization.path,
          child: const AppInitializationWidget(),
        ),
      ),
    );

class AppInitializationWidget extends StatelessWidget {
  const AppInitializationWidget({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: 'Dinero',
        debugShowCheckedModeBanner: false,
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        routerConfig: inject<GoRouter>(),
        theme: appTheme,
      );
}
