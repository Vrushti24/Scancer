import 'package:flutter/material.dart';
import 'package:scancer_app/screens/login.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: Login(),
      duration: 3000,
      text: "ScanCer",
      textType: TextType.TyperAnimatedText,
      textStyle: TextStyle(
        fontSize: 40.0,fontFamily: 'akaPosse',color: Colors.white
      ),
      backgroundColor: Colors.black,
    );
  }
}