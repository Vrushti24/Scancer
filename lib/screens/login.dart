import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scancer_app/provider/google_signin.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    provider.googleLogin(context);
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Welcome",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'Andika'),
                        ),
                        const Text(
                          "Login to continue",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Andika'),
                        ),
                        const SizedBox(height: 30),
                        Image.asset(
                          'assets/images/Mobile login-01.png',
                          height: 200,
                          width: 200,
                        ),
                        const SizedBox(height: 30),
                        InkWell(
                          onTap: () async {
                            final provider = Provider.of<GoogleSignInProvider>(
                                context,
                                listen: false);
                            await provider.googleLogin(context);
                          },
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 10),
                              width: MediaQuery.of(context).size.width * 0.8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.red,
                              ),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    ImageIcon(
                                      AssetImage("assets/images/logo01.png"),
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    Center(
                                      child: Text(
                                        'Login with Google',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Andika',
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ])),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    child: const Text(
                      'SKIP',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () async {
                      Navigator.pushReplacementNamed(context, '/homepage');
                    },
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
