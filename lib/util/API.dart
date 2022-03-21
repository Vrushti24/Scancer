// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:scancer_app/util/Result.dart';

class API {
  static Result? result;

  static Future<Result?> getData(String filepath) async {
    String url =
        (await http.get(Uri.parse('http://scancerr.herokuapp.com/getURL')))
            .body;
    log(url);
    var request = http.MultipartRequest('POST', Uri.parse(url + '/getText'));
    request.files.add(await http.MultipartFile.fromPath('file', filepath));
    log("File Added");
    var response = await request.send();
    log("request Sent");
    var responseData = await response.stream.toBytes();
    var jsonResponse = String.fromCharCodes(responseData);
    result = Result.fromMap(json.decode(jsonResponse));
    log(result.toString());
    return result;
  }

  static Future<PlatformFile?> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['jpg', 'pdf', 'png', 'jpeg', 'webp']);
    // if no file is picked
    if (result == null) return null;
    // we get the file from result object
    PlatformFile file = result.files.first;
    log(file.name);
    return file;
  }
}
