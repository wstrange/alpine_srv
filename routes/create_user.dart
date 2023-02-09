import 'package:dart_frog/dart_frog.dart';
import 'package:firebase_admin/firebase_admin.dart';


Future<void> foo(Auth auth) async {
  try {
    // get a user by email
    var v = await auth.getUserByEmail('warren.strange@gmail.com');
    print(v.toJson());
  } on FirebaseException catch (e) {
    print(e.message);
  }
}

Future<Response> onRequest(RequestContext context) async {

  var auth = context.read<Auth>();

  await foo(auth);
  return Response(body: 'Create User!');
}


void apitest(Auth auth) async {
  var idToken = '';
  await auth.verifyIdToken(idToken);
  
}