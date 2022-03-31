import 'dart:developer';
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:scancer_app/provider/google_signin.dart';
import 'package:scancer_app/util/google_sheet.dart';
import 'package:scancer_app/util/local_sheet.dart';

class Sheet {
  static bool isLocalUser = true;
  static init() async {
    if (!(await GoogleSignInProvider.googleSignIn.isSignedIn())) {
      log('LocalSheet Init start');
      isLocalUser = true;
      LocalSheet.init();
      log('LocalSheet Init Complete');
    } else {
      log('googleSheet Init start');
      isLocalUser = false;
      await GoogleSheet.init();
      log('googleSheet Init Complete');
    }
  }

  static Future appendData(List<String> values) async {
    if (isLocalUser) {
      LocalSheet.appendData(values);
    } else {
      await GoogleSheet.appendData(values);
    }
  }

  static saveSheet() async {
    if (isLocalUser) {
      File file = await LocalSheet.saveSheet();
      OpenFile.open(file.path);
    } else {
      await GoogleSheet.viewSheet();
    }
  }
}
