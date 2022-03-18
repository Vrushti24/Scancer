import 'package:flutter/material.dart';

class finalData extends StatefulWidget {
  const finalData({ Key? key }) : super(key: key);

  @override
  _finalDataState createState() => _finalDataState();
}

class _finalDataState extends State<finalData> {

  TextEditingController nameController = TextEditingController();

  @override

  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    super.dispose();
  }


  Widget build(BuildContext context) {
   double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: double.infinity,
                  height: height * 0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(height * 0.15 / 2.0),
                      bottomRight: Radius.circular(height * 0.15 / 2.0),
                    ),
                    color: Colors.red,
                  ),
                  child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Verify your details ',
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Andika',
                            color: Colors.white),
                      )),
                ),
              ),
              
             
              
             Padding(
               padding: const EdgeInsets.all(15.0),
               child: TextField(
                 style: TextStyle(color: Colors.white),
                    controller: nameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white24,
                      focusColor: Colors.white,
                      border: OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.white,width: 2.0),
                      ),
                      
                      labelText: 'Date',
                      labelStyle: TextStyle(
                                  color: Colors.white,
                              )
                    ),),
             ),

              Padding(
               padding: const EdgeInsets.all(15.0),
               child: TextField(
                 style: TextStyle(color: Colors.white),
                    controller: nameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white24,
                      focusColor: Colors.white,
                      border: OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.white,width: 2.0),
                      ),
                      
                      labelText: 'Event',
                      labelStyle: TextStyle(
                                  color: Colors.white,
                              )
                    ),),
             ),

              Padding(
               padding: const EdgeInsets.all(15.0),
               child: TextField(
                 style: TextStyle(color: Colors.white),
                    controller: nameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white24,
                      focusColor: Colors.white,
                      border: OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.white,width: 2.0),
                      ),
                      
                      labelText: 'official',
                      labelStyle: TextStyle(
                                  color: Colors.white,
                              )
                    ),),
             ),

              Padding(
               padding: const EdgeInsets.all(15.0),
               child: TextField(
                 style: TextStyle(color: Colors.white),
                    controller: nameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white24,
                      focusColor: Colors.white,
                      border: OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.white,width: 2.0),
                      ),
                      
                      labelText: 'org',
                      labelStyle: TextStyle(
                                  color: Colors.white,
                              )
                    ),),
             ),

              Padding(
               padding: const EdgeInsets.all(15.0),
               child: TextField(
                 style: TextStyle(color: Colors.white),
                    controller: nameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white24,
                      focusColor: Colors.white,
                      border: OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.white,width: 2.0),
                      ),
                      
                      labelText: 'person',
                      labelStyle: TextStyle(
                                  color: Colors.white,
                              )
                    ),),
             ),

              Padding(
               padding: const EdgeInsets.all(15.0),
               child: TextField(
                 style: TextStyle(color: Colors.white),
                    controller: nameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white24,
                      focusColor: Colors.white,
                      border: OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.white,width: 2.0),
                      ),
                      
                      labelText: 'toc',
                      labelStyle: TextStyle(
                                  color: Colors.white,
                              )
                    ),),
             ),

              ],
              
              )
              )
              )
              );
  }
}