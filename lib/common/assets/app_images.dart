const String _assetsPath = 'assets/images/';

class AppImages {
  static final splash = _Splash();
  static final dashboard = _Dashboard();
  static final wallet = _Wallet();
  static final transactions = _Transactions();
  static final profile = _Profile();
  static final common = _Common();
}

class _Splash {
  String get dinero => '${_assetsPath}dinero';
}

class _Dashboard {}

class _Wallet {}

class _Transactions {}

class _Profile {}

class _Common {}
