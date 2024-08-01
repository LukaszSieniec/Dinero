import 'package:dinero/core/persistence/keys_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class SecureStorage extends KeysStorage {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  // This key will be used to determine if our application has been run for the first time.
  static const String _firstRunKey = 'FIRST_RUN';

  @override
  Future<void> initialize() async {
    try {
      // On iOS we should make use of NSUserDefaults, which does get deleted on an app uninstall.
      // Keys stored in secure storage will persist even after app uninstall.
      // So we use SharedPreferences to make use of NSUserDefaults.
      final SharedPreferences sharedPrefs =
          await SharedPreferences.getInstance();

      // Get value from shared prefs, if result is: true or null
      // then clear all needed keys from secure storage.
      final bool isFirstRun = sharedPrefs.getBool(_firstRunKey) ?? true;

      if (isFirstRun) {
        await _secureStorage.deleteAll();

        // Save the value as false to avoid clearing secure storage on another run.
        await sharedPrefs.setBool(
          _firstRunKey,
          false,
        );
      }
    } catch (error) {
      // In the future we can add here FirebaseCrashlytics or something else.
    }
  }

  @override
  Future<void> write({
    required String key,
    required String value,
  }) async =>
      _secureStorage.write(
        key: key,
        value: value,
      );

  @override
  Future<String?> read({
    required String key,
  }) async =>
      _secureStorage.read(key: key);

  @override
  Future<void> delete({
    required String key,
  }) async =>
      _secureStorage.delete(key: key);

  @override
  Future<void> deleteAll() async => _secureStorage.deleteAll();
}
