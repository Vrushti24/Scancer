import 'package:flutter/material.dart';
import 'package:scancer_app/screens/bottomnavbar.dart';
import 'package:scancer_app/screens/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavBar(),
      body:SafeArea(
              child: SingleChildScrollView(
                  child: Column(children: [

                                       Stack(
                      children: [
                         Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height*0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(80),
                            bottomRight: Radius.circular(80),
                          ),
                          color: Colors.red
                        ),
                )
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.topRight,
              child:  Icon(Icons.notifications_active_rounded,color: Colors.white,),
            ),
          ),
           Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                  Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Login()),
                                );
                },
                  child: Icon(Icons.arrow_back_rounded,color: Colors.white,),
                  ),),
            ),
                      Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('Welcome to ScanCer',
                    style: TextStyle(fontSize: 25,
                    fontFamily: 'Andika',
                    color: Colors.white),)),
              )
            ],
          ),
                  ]
                  ),
                   Padding(
                padding: const EdgeInsets.all(55.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('Click on + icon to upload your certificate',
                    style: TextStyle(fontSize: 23,
                    fontFamily: 'Andika',
                    color: Colors.white),)),
              )
                  ]
                  )
                  )
                  )
                  );
  }
}