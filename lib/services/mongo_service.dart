import 'package:mongo_dart/mongo_dart.dart';

class MongoService {
  MongoService(this._db);

  final Db _db;

  Db get db => _db;

  static Future<MongoService> connect(
    String connectionString,
  ) async {
    final db = await Db.create(
      connectionString,
    );

    await db.open();

    return MongoService(db);
  }

  Future<void> close() async {
    await _db.close();
  }

  Future<bool> ping() async {
    final result = await _db.pingCommand();

    return result['ok'] == 1;
  }
}
