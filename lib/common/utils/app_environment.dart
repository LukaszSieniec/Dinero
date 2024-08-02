enum Environment {
  dev,
  stage,
  prod,
}

class AppEnvironment {
  final String baseUrl;
  final Environment environment;

  const AppEnvironment._({
    required this.baseUrl,
    required this.environment,
  });

  factory AppEnvironment.dev() => const AppEnvironment._(
        baseUrl: 'https://api.coingecko.com/api/v3/',
        environment: Environment.dev,
      );

  factory AppEnvironment.stage() => const AppEnvironment._(
        baseUrl: 'https://api.coingecko.com/api/v3/',
        environment: Environment.stage,
      );

  factory AppEnvironment.prod() => const AppEnvironment._(
        baseUrl: 'https://api.coingecko.com/api/v3/',
        environment: Environment.prod,
      );
}
