import 'dart:io';

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

  final String appVersion;
  final String appEnv;

  const AppConfig({
    required this.environment,
    required this.port,
    required this.mongoUri,
    required this.mongoDatabase,
    required this.jwtSecret,
    required this.jwtAccessExpiresIn,
    required this.minioEndpoint,
    required this.minioAccessKey,
    required this.minioSecretKey,
    required this.minioRegion,
    required this.appVersion,
    required this.appEnv,
  });

  factory AppConfig.fromEnv() {
    return AppConfig(
      environment: Platform.environment['APP_ENV'] ?? 'development',
      port: int.tryParse(
            Platform.environment['API_PORT'] ?? '',
          ) ??
          8080,

      mongoUri: Platform.environment['MONGODB_URI'] ?? '',
      mongoDatabase:
          Platform.environment['MONGO_DATABASE'] ?? '',

      jwtSecret: Platform.environment['JWT_SECRET'] ?? '',
      jwtAccessExpiresIn: int.tryParse(
            Platform.environment['JWT_ACCESS_EXPIRATION'] ?? '',
          ) ??
          900000,

      minioEndpoint:
          Platform.environment['MINIO_ENDPOINT'] ?? '',

      minioAccessKey:
          Platform.environment['MINIO_ACCESS_KEY'] ?? '',

      minioSecretKey:
          Platform.environment['MINIO_SECRET_KEY'] ?? '',

      minioRegion:
          Platform.environment['MINIO_REGION'] ?? 'us-east-1',

      appVersion:
          Platform.environment['APP_VERSION'] ?? 'unknown',
      
      appEnv: Platform.environment['APP_ENV'] ?? 'development',
    );
  }
}
