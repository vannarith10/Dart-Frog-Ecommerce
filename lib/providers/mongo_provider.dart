import 'package:dart_frog/dart_frog.dart';
import '../services/mongo_service.dart';

Middleware mongoProvider(
  MongoService mongoService,
) {
  return provider<MongoService>(
    (context) => mongoService,
  );
}