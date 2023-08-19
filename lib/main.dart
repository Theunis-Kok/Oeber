import 'package:flutter/material.dart';
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
        colorSchemeSeed: const Color.fromARGB(255, 139, 123, 85),
        scaffoldBackgroundColor: const Color(0xFF171413),
      ),
      home: const LoginScreen(),
    );
  }
}
