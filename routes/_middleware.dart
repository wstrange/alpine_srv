import 'dart:io';

import 'package:alpine_srv/fservice.dart';
import 'package:firebase_admin/firebase_admin.dart';

import 'package:dart_frog/dart_frog.dart';

// see https://github.com/dbilgin/frog_firebase_auth_sample/tree/master/routes

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(provider<Auth>((_) => fbService.app.auth()))
      .use(_authValidator())
    ;
}

Middleware _authValidator() {
  return (handler) {
    return (context) async {
      try {
        print('headers = ${context.request.headers}');
        final token =
            context.request.headers['Authorization'].toString().split(' ')[1];

        // print('token = $token');
        final idToken = await fbService.app.auth().verifyIdToken(token);

        print('claims = ${idToken.claims}');
        return handler(
          context.provide<String>(() => idToken.claims.subject),
        );
      } catch (e) {
        print('error validating token = $e');
        return Response(statusCode: HttpStatus.unauthorized);
      }
    };
  };
}
