import 'dart:convert';
import 'dart:developer';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:scancer_app/util/Result.dart';

class API {
  static late Result result;
  static late String url;

  static Future<void> getURL() async {
    http.Response response =
        await http.get(Uri.parse('http://scancerr.herokuapp.com/getURL'));
    url = response.body;
  }

  static Future<Result?> getData() async {
    await getURL();
    log(url);
    String? file = await pickFile();
    if (file == null) {
      log("File Is null");
      return null;
    }
    log(file);
    var request = http.MultipartRequest('POST', Uri.parse(url + '/getText'));
    request.files.add(await http.MultipartFile.fromPath('file', file));
    log("File Added");
    var response = await request.send();
    log("request Sent");
    var responseData = await response.stream.toBytes();
    var jsonResponse = String.fromCharCodes(responseData);
    result = Result.fromMap(json.decode(jsonResponse));
    log(result.toString());
    return result;
  }

  static Future<String?> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['jpg', 'pdf', 'png', 'jpeg', 'webp']);
    // if no file is picked
    if (result == null) return null;
    // we get the file from result object
    PlatformFile file = result.files.first;
    log(file.name);
    return file.path;
  }
}
