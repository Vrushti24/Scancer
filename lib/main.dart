import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scancer_app/provider/google_signin.dart';
import 'package:scancer_app/screens/homepage.dart';
import 'package:scancer_app/screens/login.dart';
import 'package:scancer_app/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(context),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        routes: {
          '/homepage': (context) => const HomePage(),
          '/login': (context) => const Login(),
        },
      ));
}
