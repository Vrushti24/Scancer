//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  Future googleLogin() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn().signIn().catchError((onError) {
      print("Error $onError");
    });
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);

      print(FirebaseAuth.instance.currentUser?.displayName);
      // if (googleUser == null) return;
      // user = googleUser;

      // final credential = GoogleAuthProvider.credential(
      //   accessToken: googleAuth.accessToken,
      //   idToken: googleAuth.idToken,
      // );

      // await FirebaseAuth.instance.signInWithCredential(credential);
      notifyListeners();
    }
  }
}
