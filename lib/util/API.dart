import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:scancer_app/util/Result.dart';

class API {
  static late String url;
  static Future<void> getURL() async {
    http.Response response =
        await http.get(Uri.parse('http://scancerr.herokuapp.com/getURL'));
    url = response.body;
  }

  static Future<Result> getData() async {
    await getURL();
    print(url);
    var request = http.MultipartRequest('POST', Uri.parse(url + '/getText'));
    var picture = http.MultipartFile.fromBytes('file',
        (await rootBundle.load('assets/images/cer.jpg')).buffer.asUint8List(),
        filename: 'testimage.png');
    request.files.add(picture);
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var jsonResponse = String.fromCharCodes(responseData);
    Result result = Result.fromMap(json.decode(jsonResponse));
    print(result);
    return result;
  }
}
