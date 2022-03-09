import 'package:flutter/material.dart';
import 'package:scancer_app/screens/homepage.dart';
import 'package:scancer_app/screens/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                  width:MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Welcome,",
                      style: TextStyle(color: Colors.white,
                      fontSize: 30, 
                      fontFamily: 'Andika'),),
                      Text("Sign Up to continue",
                      style: TextStyle(color: Colors.white,
                      fontSize: 20, 
                      fontFamily: 'Andika'),),
                     
                      SizedBox(height:30),
                      Image.asset('assets/images/Mobile login02-01.png',
                      height: 200,
                      width: 200,),
                      
                      SizedBox(height:30),
                      Container(
                        margin: EdgeInsets.symmetric(vertical:10),
                        padding: EdgeInsets.symmetric(horizontal:50,vertical:0),
                        width: MediaQuery.of(context).size.width*0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey,
                        ),
                        child: TextField(
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            icon: Icon(Icons.email_rounded, color: Colors.red,),
                            hintText: 'Enter Email Id',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      
                      //SizedBox(height:5),
                      Container(
                        margin: EdgeInsets.symmetric(vertical:10),
                        padding: EdgeInsets.symmetric(horizontal:50,vertical:0),
                        width: MediaQuery.of(context).size.width*0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey,
                        ),
                        child: TextField(
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            icon: Icon(Icons.password_rounded, color: Colors.red,),
                            hintText: 'Enter Password',
                            border: InputBorder.none,
                          ),
                        ),
                      ),

                       InkWell(
                            onTap: () {
                               Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => HomePage()),);
                            },
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical:10),
                              padding: EdgeInsets.symmetric(horizontal:50,vertical:10),
                              width: MediaQuery.of(context).size.width*0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.red,
                            ),
                            child: Center(
                              child: Text('Create account',style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Andika',
                                fontSize: 15,
                              ),),
                            ),
                        ),
                          ),
                    
                       Center(
                              child: Text('------- or -------',style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Andika',
                                fontSize: 15,
                              ),),
                            ),

                      InkWell(
                            onTap: () {
                               Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => HomePage()),);
                            },
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical:10),
                              padding: EdgeInsets.symmetric(horizontal:50,vertical:10),
                              width: MediaQuery.of(context).size.width*0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.red,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ImageIcon(
                                          AssetImage("assets/images/logo01.png"),
                                         // color: Colors.white,
                                          size: 25,
                                      ),
                              Center(
                                child: Text('Sign up with Google',style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Andika',
                                  fontSize: 15,
                                ),),
                              ),
                              ])
                        ),
                          ),
                          SizedBox(height:90)
                        ],
                  ),
                ),),
            ),
            
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.07,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                  ),
                  color: Colors.red
                ),
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Login()),
                                  );
                  },
                  child: Text("Already have an account? Login",
                  style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Andika',
                                fontSize: 15,),
                ),
              ),
            )
        )],),
      )
    );
  }
}