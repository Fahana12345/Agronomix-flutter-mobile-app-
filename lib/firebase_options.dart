// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDucu8MkOSL-lhAC2VlcJyMzDm08OX-B1A',
    appId: '1:465665204212:web:caaead13d24e95de83e3a1',
    messagingSenderId: '465665204212',
    projectId: 'agronomix-ce1e5',
    authDomain: 'agronomix-ce1e5.firebaseapp.com',
    storageBucket: 'agronomix-ce1e5.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDoZH3VezZVjgHAElL8nwXlbDJdahA62ko',
    appId: '1:465665204212:android:59710db150431eaf83e3a1',
    messagingSenderId: '465665204212',
    projectId: 'agronomix-ce1e5',
    storageBucket: 'agronomix-ce1e5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB3VuzDMuwgsNSd0AjTtH5btASc7ookjbg',
    appId: '1:465665204212:ios:7f8e9b11fb5e76de83e3a1',
    messagingSenderId: '465665204212',
    projectId: 'agronomix-ce1e5',
    storageBucket: 'agronomix-ce1e5.appspot.com',
    iosBundleId: 'com.Ralfiz.agronomix',
  );
}