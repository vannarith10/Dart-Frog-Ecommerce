import 'package:minio/minio.dart';

class MinioService {
  final Minio _client;

  MinioService(this._client);

  Minio get client => _client;

  factory MinioService.create({
    required String endpoint,
    required String accessKey,
    required String secretKey,
    required String region,
  }) {
    final client = Minio(
      endPoint: endpoint,
      accessKey: accessKey,
      secretKey: secretKey,
      region: region,
      useSSL: false,
    );

    return MinioService(client);
  }
}
