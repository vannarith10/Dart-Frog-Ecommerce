class AppConfig {
  final String environment;
  final int port;

  final String mongoUri;
  final String mongoDatabase;

  final String jwtSecret;
  final int jwtAccessExpiresIn;

  final String minioEndpoint;
  final String minioAccessKey;
  final String minioSecretKey;
  final String minioRegion;

  const AppConfig ({
    required this.environment,
    required this.port,
    required this.mongoUri,
    required this.mongoDatabase,
    required this.jwtSecret,
    required this.jwtAccessExpiresIn,
    required this.minioEndpoint,
    required this.minioAccessKey,
    required this.minioSecretKey,
    required this.minioRegion
  });

}
