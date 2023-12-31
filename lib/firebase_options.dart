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
    apiKey: 'AIzaSyAvGruxS4rModIiHjFbWCXSobcMpa4kHO8',
    appId: '1:75709773713:web:6ef6c8937672d9f5e88c30',
    messagingSenderId: '75709773713',
    projectId: 'instagram-clone-b7845',
    authDomain: 'instagram-clone-b7845.firebaseapp.com',
    storageBucket: 'instagram-clone-b7845.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDlM8smrq9EFF7B-XpvsEHY6oXzvcaNwJE',
    appId: '1:75709773713:android:12c4bc1884e348bbe88c30',
    messagingSenderId: '75709773713',
    projectId: 'instagram-clone-b7845',
    storageBucket: 'instagram-clone-b7845.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAl_Y5SjOh9MhG5ub18_pDc0_-E2kbfkt8',
    appId: '1:75709773713:ios:dfff3f42c7da7a2ce88c30',
    messagingSenderId: '75709773713',
    projectId: 'instagram-clone-b7845',
    storageBucket: 'instagram-clone-b7845.appspot.com',
    iosClientId: '75709773713-7ko0sckrqnd46mgihsc79kbvb2p5561g.apps.googleusercontent.com',
    iosBundleId: 'com.example.instagramClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAl_Y5SjOh9MhG5ub18_pDc0_-E2kbfkt8',
    appId: '1:75709773713:ios:9a2aea3aac5bce6fe88c30',
    messagingSenderId: '75709773713',
    projectId: 'instagram-clone-b7845',
    storageBucket: 'instagram-clone-b7845.appspot.com',
    iosClientId: '75709773713-a1ekglrnbpb08ig9jc2gftmcsr8ren86.apps.googleusercontent.com',
    iosBundleId: 'com.example.instagramClone.RunnerTests',
  );
}
