import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordVisible = false;

  //------------------------------Widget Rendering------------------------------\\

  Widget renderLogo() {
    return Expanded(
      flex: 1,
      child: Center(
        child: Image.asset(
          'assets/images/oeber_logo.png',
          width: 225,
          height: 2225,
        ),
      ),
    );
  }

  Widget loginWithGoogleButton() {
    return ElevatedButton.icon(
      onPressed: () {
        // Handle Google login here
      },
      icon: Image.asset(
        'assets/images/google_logo.png',
        height: 40,
        width: 40,
      ),
      label: const Text(
        'Login with Google',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color(0xFF605a57),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget registerWithGoogle() {
    return ElevatedButton.icon(
      onPressed: () {
        // Handle Google login here
      },
      icon: Image.asset(
        'assets/images/google_logo.png',
        height: 40,
        width: 40,
      ),
      label: const Text(
        'Register with Google',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color(0xFF605a57),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget loginButton() {
    return ElevatedButton(
      onPressed: () {
        tryLogin();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color(0xFF605a57),
        ),
        minimumSize: MaterialStateProperty.all<Size>(const Size(150, 45)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: const BorderSide(color: Colors.white),
          ),
        ),
      ),
      child: const Text(
        'Login',
        style: TextStyle(color: Colors.white, fontSize: 19),
      ),
    );
  }

  Widget registerButton() {
    return ElevatedButton(
      onPressed: () {
        tryRegister();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color(0xFF605a57),
        ),
        minimumSize: MaterialStateProperty.all<Size>(const Size(150, 45)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: const BorderSide(color: Colors.white),
          ),
        ),
      ),
      child: const Text(
        'Register',
        style: TextStyle(color: Colors.white, fontSize: 19),
      ),
    );
  }

  Widget dividerWithText(String text) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Colors.grey,
            thickness: 2,
            height: 20,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            text,
            style: const TextStyle(fontSize: 18),
          ),
        ),
        const Expanded(
          child: Divider(
            color: Colors.grey,
            thickness: 2,
            height: 20,
          ),
        ),
      ],
    );
  }

  Widget emailTextField() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: emailController,
        style: const TextStyle(color: Colors.white, fontSize: 18),
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: Colors.white, fontSize: 18),
          filled: false,
          hintText: 'Email',
          prefixIcon: const Icon(Icons.email),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(width: 2.0),
          ),
        ),
      ),
    );
  }

  Widget passwordTextField() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        obscureText: !isPasswordVisible,
        controller: passwordController,
        style: const TextStyle(color: Colors.white, fontSize: 18),
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: Colors.white, fontSize: 18),
          filled: false,
          hintText: 'Password',
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: () => togglePasswordVisibility(),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(width: 2.0),
          ),
        ),
      ),
    );
  }

  Widget confirmPasswordTextField() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        obscureText: !isPasswordVisible,
        controller: confirmPasswordController,
        style: const TextStyle(color: Colors.white, fontSize: 18),
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: Colors.white, fontSize: 18),
          filled: false,
          hintText: 'Confirm Password',
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: () => togglePasswordVisibility(),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(width: 2.0),
          ),
        ),
      ),
    );
  }

  Widget renderContainer() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: const BoxDecoration(
        color: Color(0xFF605a57),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TabBar(
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                labelStyle: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 21,
                    fontWeight: FontWeight.w600),
                tabs: [
                  Tab(text: 'Login'),
                  Tab(text: 'Register'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Login Tab Page
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        loginWithGoogleButton(),
                        const SizedBox(height: 20),
                        dividerWithText("or"),
                        emailTextField(),
                        passwordTextField(),
                        loginButton(),
                      ],
                    ),
                  ),
                  // Register Tab Page
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        emailTextField(),
                        passwordTextField(),
                        confirmPasswordTextField(),
                        registerButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  //-------------------------------------------------------------------------\\

  //------------------------------Functionality------------------------------\\

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  bool areFieldsFilledLogin() {
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  bool areFieldsFilledRegister() {
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty;
  }

  bool isPasswordMatch() {
    return passwordController.text == confirmPasswordController.text;
  }

  void tryLogin() {
    if (!areFieldsFilledLogin()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Missing Information"),
            content: const Text("Please fill out all the required fields."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      // Handle successful login
    }
  }

  void tryRegister() {
    if (!areFieldsFilledRegister()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Missing Information"),
            content: const Text("Please fill out all the required fields."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    } else if (!isPasswordMatch()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Password Mismatch"),
            content: const Text("Passwords do not match. Please try again."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      // Handle successful registration
    }
  }

  //-------------------------------------------------------------------------\\

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            renderLogo(),
            renderContainer(),
          ],
        ),
      ),
    );
  }
}
