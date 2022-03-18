import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class API {
  API() {
    getURL();
  }
  static String url = "";
  static Future<void> getURL() async {
    http.Response response =
        await http.get(Uri.parse('http://scancerr.herokuapp.com/getURL'));
    url = response.body;
  }

  static void getData() async {
    await getURL();
    print(url);
    var request = http.MultipartRequest('POST', Uri.parse(url + '/getText'));
    var picture = http.MultipartFile.fromBytes(
        'file',
        (await rootBundle.load('assets/images/logo01.png'))
            .buffer
            .asUint8List(),
        filename: 'testimage.png');
    request.files.add(picture);
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var result = String.fromCharCodes(responseData);

    print(result);
  }
}
