import 'package:flutter/material.dart';
import 'package:oeber/methods/validation_methods.dart';
import 'package:oeber/pages/forgot_password_page/forgot_password_page.dart';
import 'package:oeber/pages/register_page/register_page.dart';
import 'package:oeber/widgets/input_password_textfield.dart';
import 'package:oeber/widgets/input_textfield_decoration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //------------------------------Widget Rendering------------------------------\\
  Widget renderLogo() {
    return const Padding(
      padding:
          EdgeInsets.only(top: 40.0, left: 50.0, right: 50.0, bottom: 40.0),
      child: Image(
        image: AssetImage(
          'assets/images/oeber_logo.png',
        ),
      ),
    );
  }

  Widget renderHeader(String header) {
    return Text(
      header,
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget renderInputArea() {
    return Form(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 30.0, left: 40.0, right: 40.0, bottom: 10.0),
            child: TextFormField(
              decoration: textfieldDecoration(
                const Icon(
                  Icons.email,
                  size: 30,
                ),
                "Email",
              ),
              validator: (email) => emailValidator(email),
              controller: emailController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 40.0, right: 40.0),
            child: InputPasswordTextField(
              "Password",
              const Icon(
                Icons.lock,
                size: 30,
              ),
              passwordController,
            ),
          ),
        ],
      ),
    );
  }

  Widget renderForgotPassword() {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.only(top: 50.0, left: 40.0, right: 40.0),
        child: Text(
          "Forgot Password?",
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w600,
            //color: primaryColour,
          ),
        ),
      ),
    );
  }

  Widget renderLoginButton() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 40.0,
        left: 40.0,
        right: 40.0,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            shape: const StadiumBorder()),
        onPressed: () {
          // signIn();
        },
        child: const Text(
          'Log in',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  Widget renderSignUpText() {
    return Padding(
      padding: const EdgeInsets.only(top: 95.0, left: 8.0, right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Don't have an account?",
            style: TextStyle(
              fontSize: 19,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                  ));
            },
            child: const Text(
              " SIGN UP",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                //color: primaryColour,
              ),
            ),
          ),
        ],
      ),
    );
  }
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
            renderLogo(),
            Column(
              children: [
                renderHeader("Log in to your account"),
                renderInputArea(),
                renderForgotPassword(),
                renderLoginButton(),
                renderSignUpText(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
