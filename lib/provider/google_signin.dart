import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/sheets/v4.dart' as gsa;
import 'package:scancer_app/util/sheet.dart';

class GoogleSignInProvider extends ChangeNotifier {
  static final GoogleSignIn googleSignIn =
      GoogleSignIn(scopes: [gsa.SheetsApi.spreadsheetsScope]);
  BuildContext context;
  GoogleSignInProvider(
    this.context,
  );
  Future googleLogin(BuildContext context) async {
    final GoogleSignInAccount? googleUser =
        await googleSignIn.signIn().catchError((onError) {
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
      Sheet.init();
      Sheet.isLocalUser = false;
      Navigator.pushReplacementNamed(context, '/homepage');
    }
  }
}
