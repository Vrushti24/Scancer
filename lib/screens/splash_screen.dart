import 'package:flutter/material.dart';
import 'package:scancer_app/screens/login.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: const Login(),
      duration: 3000,
      text: "ScanCer",
      textType: TextType.TyperAnimatedText,
      textStyle: const TextStyle(
        fontSize: 40.0,
        fontFamily: 'akaPosse',
        color: Colors.white,
      ),
      backgroundColor: Colors.black,
    );
  }
}
