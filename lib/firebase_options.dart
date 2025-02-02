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
    apiKey: 'AIzaSyDkiaFke90itPD4rP0XET6cTCzDZWc6EPQ',
    appId: '1:942919310011:web:8218eda6c194c7f988679e',
    messagingSenderId: '942919310011',
    projectId: 'keepnotes-c8ff9',
    authDomain: 'keepnotes-c8ff9.firebaseapp.com',
    storageBucket: 'keepnotes-c8ff9.appspot.com',
    measurementId: 'G-FCFH4MCS1C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAUK_d3J_Wk1fTVMNOSI5JZ_ehyHG17egU',
    appId: '1:942919310011:android:467a5312109e91ef88679e',
    messagingSenderId: '942919310011',
    projectId: 'keepnotes-c8ff9',
    storageBucket: 'keepnotes-c8ff9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCD4rIgPAj0cOMolWvkYkwLvHib26sn_xw',
    appId: '1:942919310011:ios:98417bf50313eaa088679e',
    messagingSenderId: '942919310011',
    projectId: 'keepnotes-c8ff9',
    storageBucket: 'keepnotes-c8ff9.appspot.com',
    iosBundleId: 'com.example.keepnotes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCD4rIgPAj0cOMolWvkYkwLvHib26sn_xw',
    appId: '1:942919310011:ios:98417bf50313eaa088679e',
    messagingSenderId: '942919310011',
    projectId: 'keepnotes-c8ff9',
    storageBucket: 'keepnotes-c8ff9.appspot.com',
    iosBundleId: 'com.example.keepnotes',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDkiaFke90itPD4rP0XET6cTCzDZWc6EPQ',
    appId: '1:942919310011:web:eb0e9b049808a01f88679e',
    messagingSenderId: '942919310011',
    projectId: 'keepnotes-c8ff9',
    authDomain: 'keepnotes-c8ff9.firebaseapp.com',
    storageBucket: 'keepnotes-c8ff9.appspot.com',
    measurementId: 'G-WJ7NWZF9MX',
  );
}
