import 'package:flutter/material.dart';
import 'package:oeber/pages/login_page/login_page.dart';

import '../../methods/validation_methods.dart';
import '../../widgets/input_password_textfield.dart';
import '../../widgets/input_textfield_decoration.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //------------------------------Widget Rendering------------------------------\\
  Widget renderBackArrow() {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0, left: 16),
      child: Row(
        children: [
          GestureDetector(
            child: const Icon(
              Icons.arrow_back,
              size: 40,
              color: Colors.white,
            ),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Widget renderLogo() {
    return const Padding(
      padding:
          EdgeInsets.only(top: 50.0, left: 50.0, right: 50.0, bottom: 40.0),
      child: Image(
        image: AssetImage(
          'assets/images/PMN_Logo_New.png',
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
            padding: const EdgeInsets.only(top: 30.0, left: 40.0, right: 40.0),
            child: TextFormField(
              decoration: textfieldDecoration(
                const Icon(
                  Icons.email,
                  size: 30,
                ),
                "Email",
              ),
              controller: emailController,
              validator: (email) => emailValidator(email),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),
            child: InputPasswordTextField(
              "Password",
              const Icon(
                Icons.lock,
                size: 30,
              ),
              passwordController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),
            child: InputPasswordTextField(
              "Re-enter Password",
              const Icon(
                Icons.lock,
                size: 30,
              ),
              confirmPasswordController,
            ),
          ),
        ],
      ),
    );
  }

  Widget renderSignUpButton() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 80.0,
        left: 40.0,
        right: 40.0,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            shape: const StadiumBorder()),
        onPressed: () {
          // signUp();
        },
        child: const Text(
          'Create Account',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  Widget renderSignUpText() {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, left: 8.0, right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Already have an account?",
            style: TextStyle(
              fontSize: 19,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ));
            },
            child: const Text(
              " SIGN IN",
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

  //TODO: insert sign up method

  //-------------------------------------------------------------------------\\

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            renderBackArrow(),
            renderLogo(),
            Column(
              children: [
                renderHeader("Create account"),
                renderInputArea(),
                renderSignUpButton(),
                renderSignUpText(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
