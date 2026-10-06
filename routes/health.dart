import 'dart:io'; // Required for Platform.environment
import 'package:dart_frog/dart_frog.dart';
import 'package:ecommerce_api/config/app_config.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:http/http.dart' as http;

Future<Response> onRequest(RequestContext context) async {
  final config = AppConfig.fromEnv();

  // 1. Access environment variables via Platform.environment
  final mongoUri = config.mongoUri;
  final minioEndpoint = config.minioEndpoint;
  final minioHealthUrl = '$minioEndpoint/minio/health/live';

  final results = <String, dynamic>{
    'api': 'running',
    'version': config.appVersion,
    'environment': config.appEnv,
    'timestamp': DateTime.now().toIso8601String(),
  };

  // 2. Test MongoDB Connection
  try {
    final db = await Db.create(mongoUri);
    await db.open();

    // FIX: Use pingCommand() instead of command()
    final ping = await db.pingCommand();

    await db.close();
    results['mongodb'] = {'status': 'connected', 'ok': ping['ok'] == 1};
  } catch (e) {
    results['mongodb'] = {'status': 'error', 'message': e.toString()};
  }

  // 3. Test MinIO Connection
  try {
    final response = await http.get(Uri.parse(minioHealthUrl));
    if (response.statusCode == 200) {
      results['minio'] = {
        'status': 'connected',
        'statusCode': response.statusCode,
      };
    } else {
      results['minio'] = {
        'status': 'error',
        'message': 'HTTP ${response.statusCode}',
      };
    }
  } catch (e) {
    results['minio'] = {'status': 'error', 'message': e.toString()};
  }

  // Return 200 if both are connected, otherwise 503 Service Unavailable
  final isHealthy =
      results['mongodb']['status'] == 'connected' &&
      results['minio']['status'] == 'connected';

  return Response.json(
    body: results,
    statusCode: isHealthy ? 200 : 503,
  );
}
