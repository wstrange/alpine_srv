import 'package:dart_frog/dart_frog.dart';
import 'package:firebase_admin/firebase_admin.dart';

Future<Response> onRequest(RequestContext context) async {
  var auth = context.read<Auth>();
  return Response(body: 'ok');
}
