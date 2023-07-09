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
    apiKey: 'AIzaSyCHAy5XRY8ETQRGVnK59wevRFVWgPVfh_4',
    appId: '1:599939103444:web:112e1569943262c371d941',
    messagingSenderId: '599939103444',
    projectId: 'social-70c37',
    authDomain: 'social-70c37.firebaseapp.com',
    storageBucket: 'social-70c37.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBTqFwC4TlqLjFwGCYLR-y6-KpNUIw-4g0',
    appId: '1:599939103444:android:bbe3b0fe319d5aa671d941',
    messagingSenderId: '599939103444',
    projectId: 'social-70c37',
    storageBucket: 'social-70c37.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDB5Stp_6rHeVF0H2o2Ntn5uQ2Kcaqrb0U',
    appId: '1:599939103444:ios:fcf079bb3fdf2be071d941',
    messagingSenderId: '599939103444',
    projectId: 'social-70c37',
    storageBucket: 'social-70c37.appspot.com',
    iosClientId: '599939103444-pfb9hvtfq1kh9cp16rvrj3s7mb1u69d2.apps.googleusercontent.com',
    iosBundleId: 'com.example.social',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDB5Stp_6rHeVF0H2o2Ntn5uQ2Kcaqrb0U',
    appId: '1:599939103444:ios:fcf079bb3fdf2be071d941',
    messagingSenderId: '599939103444',
    projectId: 'social-70c37',
    storageBucket: 'social-70c37.appspot.com',
    iosClientId: '599939103444-pfb9hvtfq1kh9cp16rvrj3s7mb1u69d2.apps.googleusercontent.com',
    iosBundleId: 'com.example.social',
  );
}