/// Stores encrypted data using:
/// - Keychain in case of iOS,
/// - AES encryption in case of Android.
///
/// The AES secret key is encrypted using RSA and the RSA key itself
/// is stored in KeyStore.
abstract class KeysStorage {
  /// Initializes the [KeysStorage] when the application starts.
  ///
  /// The main purpose of this method is to ensure all the
  /// required key stores will be created once the
  /// application starts.
  Future<void> initialize();

  /// Persists given the [value] at [key].
  Future<void> write({
    required String key,
    required String value,
  });

  /// Receives the value persisted at [key].
  Future<String?> read({
    required String key,
  });

  /// Removes the value at [key].
  Future<void> delete({
    required String key,
  });

  /// Clears all the data from the [KeysStorage].
  Future<void> deleteAll();
}
