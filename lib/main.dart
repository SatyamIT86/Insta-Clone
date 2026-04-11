import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone_flutter/responsive/mobile_screen_layout.dart';
import 'package:insta_clone_flutter/responsive/responsive_layout_screen.dart';
import 'package:insta_clone_flutter/responsive/web_screen_layout.dart';
import 'package:insta_clone_flutter/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyB-fiRC4nH4idIqmnX9BpJhoyipT5n9l5s",
        appId: "1:405469134268:web:3915745060424a5400bfb9",
        messagingSenderId: "405469134268",
        projectId: "insta-clone-9dbf3",
        storageBucket: "insta-clone-9dbf3.firebasestorage.app",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      home: const ResponsiveLayout(
        webScreenLayout: WebScreenLayout(),
        mobileScreenLayout: MobileScreenLayout(),
      ),
    );
  }
}
