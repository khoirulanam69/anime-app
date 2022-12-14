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
    apiKey: 'AIzaSyD5OnzjFapXBE2C_GkZLKfnO8og7nl79OE',
    appId: '1:220211092932:web:54994c3c4ff947a4ccd891',
    messagingSenderId: '220211092932',
    projectId: 'anime-a7f3f',
    authDomain: 'anime-a7f3f.firebaseapp.com',
    storageBucket: 'anime-a7f3f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCSDlDDIWxL2ZnXc2tQStzFisB7DQRKzMc',
    appId: '1:220211092932:android:0c31825916dcf162ccd891',
    messagingSenderId: '220211092932',
    projectId: 'anime-a7f3f',
    storageBucket: 'anime-a7f3f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAU2xeNHUJN0_0nhMS2-YUlrX8AUybbKfI',
    appId: '1:220211092932:ios:105b8e22cb45bd8eccd891',
    messagingSenderId: '220211092932',
    projectId: 'anime-a7f3f',
    storageBucket: 'anime-a7f3f.appspot.com',
    androidClientId: '220211092932-3d19so59ubkr4i7s20lqa61viki2f145.apps.googleusercontent.com',
    iosClientId: '220211092932-uhlgjlqi0cc9rdpa16tqkohou2ga1ail.apps.googleusercontent.com',
    iosBundleId: 'com.example.anime',
  );
}
