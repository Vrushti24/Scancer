import 'package:flutter/material.dart';


import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
//import 'package:scancer_app/screens/bottomnavbar.dart';

import 'package:scancer_app/util/API.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
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
                        'Welcome to ScanCer',
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Andika',
                            color: Colors.white),
                      )),
                ),
              ),

              Row(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await API.getData();
                    },
                    child: const Text('Test'),
                  )
                ],

              )]))),
            
          
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          _pickFile();
        },
        child: Icon(Icons.add_a_photo_outlined,color: Colors.white, size: 29,),
        backgroundColor: Colors.red,
        tooltip: 'Capture Picture',
        elevation: 5,
        splashColor: Colors.grey,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
      
    
  }
}


void _pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true,type: FileType.custom,allowedExtensions: ['jpg','pdf','png','jpeg','webp']);
    // if no file is picked
    if (result == null) return;
    // we get the file from result object
    final file = result.files.first;
    viewFile(file);
  }
  
  
  // open the picked file
  void viewFile(PlatformFile file) {
    OpenFile.open(file.path);
  }
