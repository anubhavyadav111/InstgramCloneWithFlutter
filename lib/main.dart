import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/Screens/loginscreen.dart';
import 'package:instagram_clone/Screens/signup_screen.dart';
import 'package:instagram_clone/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
      apiKey: 'AIzaSyAvGruxS4rModIiHjFbWCXSobcMpa4kHO8',
      appId: '1:75709773713:web:6ef6c8937672d9f5e88c30',
      messagingSenderId: '75709773713',
      projectId: 'instagram-clone-b7845',
      storageBucket: 'instagram-clone-b7845.appspot.com',
    ));
  } else {
    await Firebase.initializeApp(
        options: FirebaseOptions(
      apiKey: 'AIzaSyDlM8smrq9EFF7B-XpvsEHY6oXzvcaNwJE',
      appId: '1:75709773713:android:12c4bc1884e348bbe88c30',
      messagingSenderId: '75709773713',
      projectId: 'instagram-clone-b7845',
      storageBucket: 'instagram-clone-b7845.appspot.com',
    ));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // home: ResponsiveLayout(
      //   mobileScreenLayout: MobileScreenLayout(),
      //   WebScreenLayout: WebScreenLayout(),
      // ),
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      home: const LoginScreen(),
    );
  }
}
