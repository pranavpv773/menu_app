import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:menu_app/app/features/home/view/home_screen.dart';
import 'package:menu_app/app/routes/routes.dart';

class LoginNotifier with ChangeNotifier {
  void googleLog(BuildContext context) async {
    try {
      final result = await GoogleSignIn().signIn();
      if (result == null) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Some error"),
          ),
        );
      }
      final cred = await result!.authentication;
      await FirebaseAuth.instance
          .signInWithCredential(
        GoogleAuthProvider.credential(
          accessToken: cred.accessToken,
          idToken: cred.idToken,
        ),
      )
          .then((value) {
        AppRoutes.nxtScreen(
          const HomeScreen(),
        );
      });
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.message.toString(),
          ),
        ),
      );
    }
  }
}
