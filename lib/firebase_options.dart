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
    apiKey: 'AIzaSyAs-kznTHALmdv_w_bGLJqwuVApoXAmBCI',
    appId: '1:167117325701:web:1c02be718e33e861b1b0ec',
    messagingSenderId: '167117325701',
    projectId: 'goaltiky-c6a91',
    authDomain: 'goaltiky-c6a91.firebaseapp.com',
    storageBucket: 'goaltiky-c6a91.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCDstfiSku6PqNnHAT23maSfXM8lHEY6qs',
    appId: '1:167117325701:android:f2cb0e19822d0ec6b1b0ec',
    messagingSenderId: '167117325701',
    projectId: 'goaltiky-c6a91',
    storageBucket: 'goaltiky-c6a91.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAvoS_ODLjBHXJSu55WOss6zjDJ0T8O1_4',
    appId: '1:167117325701:ios:f6be730bdf6df786b1b0ec',
    messagingSenderId: '167117325701',
    projectId: 'goaltiky-c6a91',
    storageBucket: 'goaltiky-c6a91.appspot.com',
    iosBundleId: 'com.example.goaltiky',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAvoS_ODLjBHXJSu55WOss6zjDJ0T8O1_4',
    appId: '1:167117325701:ios:f6be730bdf6df786b1b0ec',
    messagingSenderId: '167117325701',
    projectId: 'goaltiky-c6a91',
    storageBucket: 'goaltiky-c6a91.appspot.com',
    iosBundleId: 'com.example.goaltiky',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAs-kznTHALmdv_w_bGLJqwuVApoXAmBCI',
    appId: '1:167117325701:web:b0c78167914d90feb1b0ec',
    messagingSenderId: '167117325701',
    projectId: 'goaltiky-c6a91',
    authDomain: 'goaltiky-c6a91.firebaseapp.com',
    storageBucket: 'goaltiky-c6a91.appspot.com',
  );
}
