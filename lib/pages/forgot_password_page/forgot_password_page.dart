import 'package:flutter/material.dart';

import '../../methods/validation_methods.dart';
import '../../widgets/input_textfield_decoration.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();

//------------------------------Init state and dispose------------------------------\\

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  //-------------------------------------------------------------------------\\

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

  Widget renderHeaderAndSubHeader(String header, String subHeader) {
    return Column(
      children: [
        Text(
          header,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            subHeader,
            style: const TextStyle(
              fontSize: 21,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
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
              controller: emailController,
              validator: (email) => emailValidator(email),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderSubmitButton() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 220.0,
        left: 40.0,
        right: 40.0,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            shape: const StadiumBorder()),
        onPressed: () {},
        child: const Text(
          'Submit',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  //-------------------------------------------------------------------------\\

//------------------------------Functionality------------------------------\\

  //TODO: insert rest password method

//-------------------------------------------------------------------------\\

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          renderBackArrow(),
          Column(
            children: [
              renderLogo(),
              renderHeaderAndSubHeader("Forgot Password",
                  "Please enter your email below. We'll send a password reset code."),
              renderInputArea(),
              renderSubmitButton(),
            ],
          ),
        ],
      ),
    );
  }
}
