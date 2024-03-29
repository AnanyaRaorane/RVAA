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
    apiKey: 'AIzaSyDZyJxX7RhZAzSJC0EQsOjRqJ4ywplmRyM',
    appId: '1:282152325024:web:0ef7d5705557e9c2fc9ec5',
    messagingSenderId: '282152325024',
    projectId: 'rvaa-8277a',
    authDomain: 'rvaa-8277a.firebaseapp.com',
    storageBucket: 'rvaa-8277a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBVgSeT8PANkk8k51MNnyHRNGXMzYPAlW0',
    appId: '1:282152325024:android:de67f012b9983015fc9ec5',
    messagingSenderId: '282152325024',
    projectId: 'rvaa-8277a',
    storageBucket: 'rvaa-8277a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCHx28jKyKuBLcjbzc2Z-6ELmEUS2eO9JU',
    appId: '1:282152325024:ios:f737a73b1edd25cafc9ec5',
    messagingSenderId: '282152325024',
    projectId: 'rvaa-8277a',
    storageBucket: 'rvaa-8277a.appspot.com',
    iosBundleId: 'com.example.rvaa1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCHx28jKyKuBLcjbzc2Z-6ELmEUS2eO9JU',
    appId: '1:282152325024:ios:b75ae292a91e8e43fc9ec5',
    messagingSenderId: '282152325024',
    projectId: 'rvaa-8277a',
    storageBucket: 'rvaa-8277a.appspot.com',
    iosBundleId: 'com.example.rvaa1.RunnerTests',
  );
}
