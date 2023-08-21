import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oeber/pages/login_page/login_page.dart';
import 'package:oeber/widgets/loader.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> signInWithGoogle(BuildContext context) async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  await signInWithCredentials(context, credential);
}

Future<void> signInWithEmailAndPassword(
    BuildContext context, String email, String password) async {
  try {
    LoaderOverlay.show(context, null);
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      LoaderOverlay.hide();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Success"),
            content: const Text("Login successful"),
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
    });
  } on FirebaseAuthException catch (e) {
    print(e);
  } finally {
    LoaderOverlay.hide();
  }
}

Future<void> signInWithCredentials(
  BuildContext context,
  OAuthCredential credential,
) async {
  try {
    LoaderOverlay.show(context, null);
    await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      LoaderOverlay.hide();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Success"),
            content: const Text("Login successful"),
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
    });
  } on FirebaseAuthException catch (e) {
    print(e);
  } finally {
    LoaderOverlay.hide();
  }
}

Future<void> register(
    BuildContext context, String email, String password) async {
  try {
    LoaderOverlay.show(context, null);
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      LoaderOverlay.hide();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Success"),
            content: const Text("Login successful"),
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
    });
  } on FirebaseAuthException catch (e) {
    print(e);
  } finally {
    LoaderOverlay.hide();
  }
}

Widget checkAuthStatus(BuildContext context) {
  return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          //TODO insert message
          print("Something went wrong:");
          return const LoginScreen();
        } else if (snapshot.hasData) {
          print("Curent user info: ${getUser()}");
          //TODO insert homepage
          return const LoginScreen();
        } else {
          return const LoginScreen();
        }
      });
}

User? getUser() {
  return FirebaseAuth.instance.currentUser;
}

void signOut(BuildContext context) async {
  try {
    LoaderOverlay.show(context, null);
    await FirebaseAuth.instance.signOut();
  } on FirebaseAuthException catch (e) {
    print(e);
  } finally {
    LoaderOverlay.hide();
  }
}
