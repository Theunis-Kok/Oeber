import 'package:flutter/material.dart';
import 'package:oeber/methods/auth_methods.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:oeber/themes/theme_data.dart';

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
      theme: mainTheme(),
      home: checkAuthStatus(context),
    );
  }
}
