import 'package:firebase_admin/firebase_admin.dart';

final fbService = FBService();


class FBService {
  late App app;
  bool init = false;

  bool get isInitialized => init;

  Future<App> initFirebase() async {
    // applicationDefault() will look for credentials in the following locations:
    // * the service-account.json file in the package main directory
    // * the env variable GOOGLE_APPLICATION_CREDENTIALS
    // * a configuration file, specific for this library, stored in the user's home directory
    // * gcloud's application default credentials
    // * credentials from the firebase tools
    var credential = Credentials.applicationDefault();

    // when no credentials found, login using openid
    // the credentials are stored on disk for later use
    // either set the parameters clientId and clientSecret of the login method or
    // set the env variable FIREBASE_CLIENT_ID and FIREBASE_CLIENT_SECRET
    credential ??= await Credentials.login();

    var projectId = 'alpine-e4c87';
    // create an app

    app = FirebaseAdmin.instance.initializeApp(AppOptions(
        credential: credential,
        projectId: projectId,
        storageBucket: '$projectId.appspot.com'));

    init = true;
    return app;
  }
}
