import 'package:dart_frog/dart_frog.dart';

Response success(
  Object? data, {
  int statusCode = 200,
}) {
  return Response.json(
    statusCode: statusCode,
    body: {
      'success': true,
      'data': data,
    },
  );
}

Response failure(
  String message, {
  int statusCode = 400,
}) {
  return Response.json(
    statusCode: statusCode,
    body: {
      'success': false,
      'message': message,
    },
  );
}
