import 'package:flutter/material.dart';
import 'package:oeber/pages/home_page/home_page.dart';
import 'package:oeber/pages/login_page/login_page.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Oeber',
      theme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: const Color(0xFF7DDCB4),
        scaffoldBackgroundColor: const Color.fromRGBO(197, 180, 134, 100),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontFamily: 'Meticula',
          ),
        ),
      ),
      home: const FollowingPage(),
    );
  }
}
