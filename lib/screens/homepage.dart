import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:scancer_app/screens/verify_data.dart';
import 'package:scancer_app/util/API.dart';
import 'package:scancer_app/util/Result.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Column(
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
                              'Welcome to ScanCer',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Andika',
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (_isLoading)
              const Align(
                alignment: Alignment.center,
                child: Center(child: CircularProgressIndicator()),
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            setState(() {
              _isLoading = true;
            });
            Result? r = await API.getData();
            log("Data Fetched");
            if (r != null) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const VerifyData()));
            }
          } catch (e) {
            log(e.toString());
          }
          setState(() {
            _isLoading = false;
          });
        },
        child: const Icon(
          Icons.add_a_photo_outlined,
          color: Colors.white,
          size: 30,
        ),
        backgroundColor: Colors.red,
        tooltip: 'Capture Picture',
        elevation: 5,
        splashColor: Colors.grey,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
