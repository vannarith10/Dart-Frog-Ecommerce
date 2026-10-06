import 'package:dart_frog/dart_frog.dart';
import 'package:mongo_dart/mongo_dart.dart';

Future<Response> onRequest(
  RequestContext context,
) async {
  final db = context.read<Db>();

  final collections =
      await db.getCollectionNames();

  return Response.json(
    body: {
      'collections': collections,
    },
  );
}
