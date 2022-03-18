import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  BuildContext context;
  GoogleSignInProvider(
    this.context,
  );
  Future googleLogin(BuildContext context) async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn().signIn().catchError((onError) {
      log("Error $onError");
    });
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      notifyListeners();
      Navigator.pushReplacementNamed(context, '/homepage');
    }
  }
}
