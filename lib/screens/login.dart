import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scancer_app/provider/google_signin.dart';
import 'package:scancer_app/screens/homepage.dart';
import 'package:scancer_app/screens/signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Welcome Back,",
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
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 0),
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey,
                          ),
                          child: const TextField(
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.email_rounded,
                                color: Colors.red,
                              ),
                              hintText: 'Enter Email Id',
                              border: InputBorder.none,
                            ),
                          ),
                        ),

                        //SizedBox(height:5),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 0),
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey,
                          ),
                          child: const TextField(
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.password_rounded,
                                color: Colors.red,
                              ),
                              hintText: 'Enter Password',
                              border: InputBorder.none,
                            ),
                          ),
                        ),

                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                            );
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
                            child: const Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Andika',
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const Center(
                          child: Text(
                            '------- or -------',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Andika',
                              fontSize: 15,
                            ),
                          ),
                        ),

                        InkWell(
                          onTap: () {
                            final provider = Provider.of<GoogleSignInProvider>(
                                context,
                                listen: false);
                            provider.googleLogin();
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
                                      // color: Colors.white,
                                      size: 25,
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
                        const SizedBox(height: 90)
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),
                        color: Colors.red),
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()),
                        );
                      },
                      child: const Text(
                        "Don't have an account? Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Andika',
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ));
  }
}
