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
        return macos;
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
    apiKey: 'AIzaSyATmUi4qtVo17H4jPopzbXxcibo_fJ62w4',
    appId: '1:879015582623:web:bcd543dbe691ad37a8bbaa',
    messagingSenderId: '879015582623',
    projectId: 'plze-backend',
    authDomain: 'plze-backend.firebaseapp.com',
    storageBucket: 'plze-backend.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAnl_4h0t2AdhSP07kFyPi2ylarh-QvAvE',
    appId: '1:879015582623:android:f12d282c8df535cea8bbaa',
    messagingSenderId: '879015582623',
    projectId: 'plze-backend',
    storageBucket: 'plze-backend.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBxFIUwRrLXSUNJkmSAT9FwYhAdJ0T0Yq4',
    appId: '1:879015582623:ios:2cc2b29f22b9bde1a8bbaa',
    messagingSenderId: '879015582623',
    projectId: 'plze-backend',
    storageBucket: 'plze-backend.appspot.com',
    iosClientId: '879015582623-71affu9pu7p50akh99oe1g47d6hksotk.apps.googleusercontent.com',
    iosBundleId: 'com.example.slidingPuzzle',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBxFIUwRrLXSUNJkmSAT9FwYhAdJ0T0Yq4',
    appId: '1:879015582623:ios:2cc2b29f22b9bde1a8bbaa',
    messagingSenderId: '879015582623',
    projectId: 'plze-backend',
    storageBucket: 'plze-backend.appspot.com',
    iosClientId: '879015582623-71affu9pu7p50akh99oe1g47d6hksotk.apps.googleusercontent.com',
    iosBundleId: 'com.example.slidingPuzzle',
  );
}