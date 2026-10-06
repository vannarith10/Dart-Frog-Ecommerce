import 'package:dart_frog/dart_frog.dart';

import '../services/minio_service.dart';

Middleware minioProvider(
  MinioService minioService,
) {
  return provider<MinioService>(
    (context) => minioService,
  );
}
