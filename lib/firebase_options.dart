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
    apiKey: 'AIzaSyARMOxn2TY4eXkjOWTBrL9qN1SI8HNyC_8',
    appId: '1:981167433013:web:44cea4fd7be2f99ee3187c',
    messagingSenderId: '981167433013',
    projectId: 'mcq-quiz-3ad3b',
    authDomain: 'mcq-quiz-3ad3b.firebaseapp.com',
    storageBucket: 'mcq-quiz-3ad3b.appspot.com',
    measurementId: 'G-9VLD96LHC2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBdZgZpHVlkxI2_C2G9L5LLrws3cUKcBo0',
    appId: '1:981167433013:android:1821e67b95924b3de3187c',
    messagingSenderId: '981167433013',
    projectId: 'mcq-quiz-3ad3b',
    storageBucket: 'mcq-quiz-3ad3b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBNvXe6htv52hhIl77Q2WdQ7kPyIHmYHKg',
    appId: '1:981167433013:ios:29e8f878d859552ee3187c',
    messagingSenderId: '981167433013',
    projectId: 'mcq-quiz-3ad3b',
    storageBucket: 'mcq-quiz-3ad3b.appspot.com',
    iosClientId: '981167433013-tda7tr3qv59u2jirto7qf3brucfv4gma.apps.googleusercontent.com',
    iosBundleId: 'com.example.earnestTask',
  );
}
