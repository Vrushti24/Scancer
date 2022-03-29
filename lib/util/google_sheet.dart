import 'dart:developer';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:googleapis/sheets/v4.dart' as gsa;
import 'package:scancer_app/provider/google_signin.dart';
import 'package:scancer_app/util/Result.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GoogleSheet {
  static late String?id = null;
  static late Client client;
  static late gsa.SheetsApi api;

  static Future<String?> createSpreadsheet() async {
    try {
      gsa.Spreadsheet sheet = gsa.Spreadsheet(
          properties: gsa.SpreadsheetProperties(title: 'Scancer'));
      sheet = await api.spreadsheets.create(sheet);
      print('=================================================');
      print(sheet.spreadsheetId);
      gsa.ValueRange vr = gsa.ValueRange.fromJson({
        'values': [Result.fields]
      });
      await api.spreadsheets.values.append(vr, sheet.spreadsheetId!, 'A:F',
          valueInputOption: 'USER_ENTERED');
      if (sheet.spreadsheetId != null) id = sheet.spreadsheetId!;
      return sheet.spreadsheetId;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future appendData(List<String> values) async {
    gsa.ValueRange vr = gsa.ValueRange.fromJson({
      'values': [values]
    });
    try {
      await api.spreadsheets.values
          .append(vr, id!, 'A:F', valueInputOption: 'USER_ENTERED');
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future init() async {
    Client? client =
        await GoogleSignInProvider.googleSignIn.authenticatedClient();
    if (client != null) {
      api = gsa.SheetsApi(client);
    }
    try {
      final doc = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.email).get();
      id=doc.get('id');
      print(id);
      await api.spreadsheets.get(id!);
    } on PlatformException catch(e)  {
      print(e);
        String? sid = await createSpreadsheet();
        if (sid != null) {
          id = sid;
          await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.email).set({'id':sid});
        }
    }
    
    catch (e) {
      //gsa.DetailedApiRequestError er = e as gsa.DetailedApiRequestError;
      //if (er.status != null && (er.status == 403 || er.status == 404)) {
        String? sid = await createSpreadsheet();
        if (sid != null) {
          id = sid;
          await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.email).set({'id':sid});
        }
      
    }
  }

  static Future viewSheet() async {
    gsa.Spreadsheet sheet = await api.spreadsheets.get(id!);
    if (sheet.spreadsheetUrl != null) {
      launch(sheet.spreadsheetUrl!);
    }
  }
}
