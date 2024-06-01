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
    apiKey: 'AIzaSyBMNiVBpGykP3yoKJiEPeWHr1gEQ0imUMk',
    appId: '1:714839162169:web:dc60ae08724dd417a33ce8',
    messagingSenderId: '714839162169',
    projectId: 'indoorairquality-3e923',
    authDomain: 'indoorairquality-3e923.firebaseapp.com',
    storageBucket: 'indoorairquality-3e923.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCpeQPEwWhwB9CiRlOZAvG2dMQKs9hnknk',
    appId: '1:714839162169:android:d46c830f2c6e0438a33ce8',
    messagingSenderId: '714839162169',
    projectId: 'indoorairquality-3e923',
    storageBucket: 'indoorairquality-3e923.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBn0z8Chb7r0BgjnqyaOcx8HcES0Qt9VZ8',
    appId: '1:714839162169:ios:262964562d3fef25a33ce8',
    messagingSenderId: '714839162169',
    projectId: 'indoorairquality-3e923',
    storageBucket: 'indoorairquality-3e923.appspot.com',
    androidClientId: '714839162169-shcbb9h1sdaa4hn57pee4gke5crc0eip.apps.googleusercontent.com',
    iosClientId: '714839162169-ec93t7fjb4am9l857sg2mg4ctdve3g9s.apps.googleusercontent.com',
    iosBundleId: 'com.example.indoorAirQuality',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBn0z8Chb7r0BgjnqyaOcx8HcES0Qt9VZ8',
    appId: '1:714839162169:ios:262964562d3fef25a33ce8',
    messagingSenderId: '714839162169',
    projectId: 'indoorairquality-3e923',
    storageBucket: 'indoorairquality-3e923.appspot.com',
    androidClientId: '714839162169-shcbb9h1sdaa4hn57pee4gke5crc0eip.apps.googleusercontent.com',
    iosClientId: '714839162169-ec93t7fjb4am9l857sg2mg4ctdve3g9s.apps.googleusercontent.com',
    iosBundleId: 'com.example.indoorAirQuality',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBMNiVBpGykP3yoKJiEPeWHr1gEQ0imUMk',
    appId: '1:714839162169:web:ec79b93d250edf06a33ce8',
    messagingSenderId: '714839162169',
    projectId: 'indoorairquality-3e923',
    authDomain: 'indoorairquality-3e923.firebaseapp.com',
    storageBucket: 'indoorairquality-3e923.appspot.com',
  );

}