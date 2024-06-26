// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBbD1-pmNJo8CdiumxG1hZL_ioqzeFpGnw',
    appId: '1:754920655653:web:0bf17bdd5d2b3f3eb2a8cc',
    messagingSenderId: '754920655653',
    projectId: 'quizzykids-f91b7',
    authDomain: 'quizzykids-f91b7.firebaseapp.com',
    storageBucket: 'quizzykids-f91b7.appspot.com',
    measurementId: 'G-0QLX1W9BFQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDCHZAyS5G55VgCQaBzdBqByqE9-zXs3Cg',
    appId: '1:754920655653:android:936b8828e8fe8951b2a8cc',
    messagingSenderId: '754920655653',
    projectId: 'quizzykids-f91b7',
    storageBucket: 'quizzykids-f91b7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDeAYyOjB5c9n_G6MPN1AFjvxjWcAKlXow',
    appId: '1:754920655653:ios:08ff08eb191166d3b2a8cc',
    messagingSenderId: '754920655653',
    projectId: 'quizzykids-f91b7',
    storageBucket: 'quizzykids-f91b7.appspot.com',
    iosClientId: '754920655653-0afr20f6e6g4kpghjp71offak4qg9bce.apps.googleusercontent.com',
    iosBundleId: 'com.example.quizzykids',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDeAYyOjB5c9n_G6MPN1AFjvxjWcAKlXow',
    appId: '1:754920655653:ios:08ff08eb191166d3b2a8cc',
    messagingSenderId: '754920655653',
    projectId: 'quizzykids-f91b7',
    storageBucket: 'quizzykids-f91b7.appspot.com',
    iosClientId: '754920655653-0afr20f6e6g4kpghjp71offak4qg9bce.apps.googleusercontent.com',
    iosBundleId: 'com.example.quizzykids',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBbD1-pmNJo8CdiumxG1hZL_ioqzeFpGnw',
    appId: '1:754920655653:web:046b3319c75cfa89b2a8cc',
    messagingSenderId: '754920655653',
    projectId: 'quizzykids-f91b7',
    authDomain: 'quizzykids-f91b7.firebaseapp.com',
    storageBucket: 'quizzykids-f91b7.appspot.com',
    measurementId: 'G-W7ZF6VXQ4E',
  );

}