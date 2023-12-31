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
    apiKey: 'AIzaSyAdzTOSOiVHq551jicPVHg1dcVAINcwtm4',
    appId: '1:470924345641:web:120f018575dfdf5864f738',
    messagingSenderId: '470924345641',
    projectId: 'e-coop3',
    authDomain: 'e-coop3.firebaseapp.com',
    storageBucket: 'e-coop3.appspot.com',
    measurementId: 'G-HCYBJM1PNH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCMbLwlEAfB6oDSXmJeJ9_sgUTm5oDXD3k',
    appId: '1:470924345641:android:40a57395fa91ae1464f738',
    messagingSenderId: '470924345641',
    projectId: 'e-coop3',
    storageBucket: 'e-coop3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAzawNaKX8dHaZmPaC65BvGuEj1GbLFoXA',
    appId: '1:470924345641:ios:00f0f4be2447c23b64f738',
    messagingSenderId: '470924345641',
    projectId: 'e-coop3',
    storageBucket: 'e-coop3.appspot.com',
    iosClientId:
        '470924345641-bkdklloh4n7bgoc8vlgue4n3fpn9lcps.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecoop3',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAzawNaKX8dHaZmPaC65BvGuEj1GbLFoXA',
    appId: '1:470924345641:ios:00f0f4be2447c23b64f738',
    messagingSenderId: '470924345641',
    projectId: 'e-coop3',
    storageBucket: 'e-coop3.appspot.com',
    iosClientId:
        '470924345641-bkdklloh4n7bgoc8vlgue4n3fpn9lcps.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecoop3',
  );
}
