import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:alpine_srv/fservice.dart';

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) async {
  // 1. Execute any custom code prior to starting the server...

  if( ! fbService.isInitialized ) {
    await fbService.initFirebase();
    print('Server starting');
  }

    // 2. Use the provided `handler`, `ip`, and `port` to create a custom `HttpServer`.
    // Or use the Dart Frog serve method to do that for you.
    return serve(handler, ip, port);
}