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
    apiKey: 'AIzaSyDelwxwJM-kiz14WYrbFTV6oYDAqVmmsEM',
    appId: '1:540820108752:web:89880f973e34fd4748f5d5',
    messagingSenderId: '540820108752',
    projectId: 'efrei-init-01',
    authDomain: 'efrei-init-01.firebaseapp.com',
    storageBucket: 'efrei-init-01.firebasestorage.app',
    measurementId: 'G-W9LVQ5ME7S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyByHBbZIDennQRTAdnzKhiMG2ELCAJxVcs',
    appId: '1:540820108752:android:c67b4e9a2b870f5148f5d5',
    messagingSenderId: '540820108752',
    projectId: 'efrei-init-01',
    storageBucket: 'efrei-init-01.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDi-6IoOzDOK2MTxVsAbHfZjLbOqLI99bw',
    appId: '1:540820108752:ios:8835900a75516cba48f5d5',
    messagingSenderId: '540820108752',
    projectId: 'efrei-init-01',
    storageBucket: 'efrei-init-01.firebasestorage.app',
    iosBundleId: 'com.example.efreiApplication',
  );
}
