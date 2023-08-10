import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //------------------------------Widget Rendering------------------------------\\

  //-------------------------------------------------------------------------\\

  //------------------------------Functionality------------------------------\\

  //TODO: insert sign in

  //-------------------------------------------------------------------------\\

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
