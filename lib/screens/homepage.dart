import 'dart:developer';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:scancer_app/provider/google_signin.dart';
import 'package:scancer_app/screens/verify_data.dart';
import 'package:scancer_app/util/API.dart';
import 'package:scancer_app/util/sheet.dart';
import 'package:scancer_app/widget/file_view.dart';
import 'package:scancer_app/widget/get_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static showSnackBar(String msg) {}
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false;
  PlatformFile? file;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double titleHeight = height * 0.13 >= 40 ? height * 0.13 : 40;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,
                  alignment: Alignment.topCenter,
                  height: titleHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(titleHeight / 2.0),
                      bottomRight: Radius.circular(titleHeight / 2.0),
                    ),
                    color: Colors.red,
                  ),
                  child: const Center(
                    child: Text(
                      'Welcome to ScanCer',
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Andika',
                          color: Colors.white),
                    ),
                  ),
                ),
                if (file != null)
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(16),
                    child: fileView(file!, MediaQuery.of(context).size.height),
                  ),
                if (file == null)
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 8.0),
                      child: const Text(
                        'Select File',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      constraints: BoxConstraints(maxHeight: height * 0.50),
                    ),
                  ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (file != null)
                      getButton(
                        'Process',
                        () async {
                          await process();
                        },
                        Icons.upload,
                      ),
                    getButton(
                      (file == null ? "Select File" : "Change File"),
                      () async {
                        file = await API.pickFile();
                        setState(() {});
                      },
                      Icons.file_open,
                    ),
                    getButton(
                      Sheet.isLocalUser ? "Save & View" : "View",
                      () async {
                        await Sheet.saveSheet();
                      },
                      Sheet.isLocalUser ? Icons.save : Icons.remove_red_eye,
                    ),
                    getButton(
                      "Logout",
                      () {
                        GoogleSignInProvider.googleSignIn.disconnect();
                        GoogleSignInProvider.googleSignIn.signOut();
                      },
                      Icons.logout,
                    ),
                  ],
                ),
              ],
            ),
            if (_isLoading)
              Container(
                alignment: Alignment.center,
                child: Container(
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> process() async {
    try {
      setState(() {
        _isLoading = true;
      });
      API.result = await API.getData(file!.path!);
      log("Data Fetched");
      if (API.result != null) {
        await Navigator.push(context,
            MaterialPageRoute(builder: (context) => const VerifyData()));
      }
      file = null;
    } catch (e) {
      log(e.toString());
    }
    setState(() {
      _isLoading = false;
    });
  }
}
