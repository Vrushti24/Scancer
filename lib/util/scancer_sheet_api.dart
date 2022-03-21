import 'dart:developer';
import 'dart:io';
import 'package:gsheets/gsheets.dart';
import 'package:open_file/open_file.dart';
import 'package:scancer_app/util/Result.dart';
import 'package:path_provider/path_provider.dart';

class ScancerSheetApi {
  static int noOfRowsInserted = 0;
  static const String _credentials = r'''{
  "type": "service_account",
  "project_id": "alpine-life-344708",
  "private_key_id": "698c744eb0d6d7a3b262581333ce4a7174ff4e7b",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCrKKR/MFVoCeel\nr0Bu4Si7UoBLN8TySsVeQaMzT4r1dOEiQcSi5rZznQUWqRqxMioWXSEKUH2yTqNC\nvckws6u9e8NXOq024vFnw5dAOZMFSaA9Kb62Rys5ynIuCjebnbRNkNzcOmW9dRwp\nsdTGCb1Wc9LtdW8Q421/0zZGunwpEwsN1Gwam7wmV0V5HiPN4642Izs5726+v+Wa\nbsShqHtPtZ6E93UrkmMaO5QgRhxiIi6NNj8mIGfnCZzngIstQPcRuog7hCkjwDx1\nKMui2C1gful0uJtJoFx50cM7BUTVVUPwg7xacW0UlorcJ92gvzCo0jeDXY3+GX3+\n335BPHD9AgMBAAECggEAGU2xIfeKjM64DxvNVgcV/zmHa3dTd7F7o79m6fFGvRp6\nJRcdg6rBiu6J/8tgvZUJuVQrzAtRxeBPzRBjM77AM0teeeEcFfrvjvRQwkcwt82m\ncZxgDDER0CGghzNt/KTQMM5rhGhivaNYVkaqyttKQUNuybm8gX3p5IWcZtDvhZ/D\nt26XJTr5wMSZSNhOZ2Ti+0Fy6Yb7oSUYV32KY+VS2bPRdj7XQNw6lD3EBFaB2C8S\n/P2+orX+AsmiguKv1M8dMYohjCFmdWVWLzrNZHj+Rmh0rPpyB4hsMNkQBlElQffM\nULc8Qfd4OVconFHUuVTlxaRJfp/MYMwtDa5hlNT+IQKBgQDkgiv4ClNQuw59tVOB\np2WIFsUANpGiuz2WIEFG15gJvSIXnaxYXeaddI6rs0h9+R6uf9aavpLqj5YMc0/v\ng2pUx0TaHqnZAxATaFNsyQtzlGu8EgMFcmyIMooQNGhQaXT356KS4LS2d6PTQBfP\nK9iadldLrYQKy2AMsQh3XS+z3QKBgQC/wChm222kgT0WR8uhgRt4nbjJ8hvV/BrV\nh26ADoTeD+7RkJ0D70LMJ4usx/L8TcLYvm/oj++ac6I35F4Wpzep3Qk1EJZrFXvc\nmF0omSxtgU5//Yc1CvIEsLmkhesXJo/n7t2HljbpcQs2StkyIRKNA62Mrx0AeIY6\nCe30YgXvoQKBgQCLgblsTol9ESaQssJPtq4y/ou5TJdvPVclL34KzRcCYxjMSDPv\nIyznVkDALM2GMzB7IosXoF+7mnvmEARuWtHw/lNXwz64wbjv0FKWaMt3/dYkVO7J\nRYljQU+vAv/oj+mcbCuB9nP9rl8zWr7ueXtdGgDDsCScHnv+Y5qinR7BdQKBgQCZ\nY9RuA5aABEqjqidBORCKulD6a0zNLvEgY0iH9BVhtokq525TmXBr9C6Ntx2vq1z1\nGdJXzdy0R1A7OdnycS3cGk+lPXG2k+cTnmbXdUDPEKOFS4B/dBQKoHzBGcfoKxbv\nSGu6bPXcZGu9sL5ylXZLi+enJOYkXEWz5AGQf2GUQQKBgFy72bxrUavLKpaBNaRg\n7pISLG+YJ0dqc8FrX4Tvmu+BbtwgG5Nj6eY5r60/7XdqXtR9kHKzb2JgbNPBa0UR\n3rNWEOOX90BX+g9WcRaSmZGtexKr1ILgQWxJGjPjRB8yEhMZbknzTgn2VDRdU08t\nuAFVgqKNV7wNmlz9HC4YAUMv\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@alpine-life-344708.iam.gserviceaccount.com",
  "client_id": "106335527392291978141",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40alpine-life-344708.iam.gserviceaccount.com"
}''';
  static const String _spreadsheetId =
      '1xvsZInMe6LXcgGbkWOX-VEZctNDTCQMNnLNPcKMjGpE';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _worksheet;
  static late final Spreadsheet spreadsheet;

  static Future init() async {
    try {
      spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _worksheet = await _getWorkSheet(spreadsheet, title: 'ScanCer');

      final firstRow = Result.fields;
      _worksheet!.values.insertRow(1, firstRow);
      _worksheet!.clear();
    } catch (e) {
      log("Error : ${e.toString()}");
    }
  }

  static Future<Worksheet?> _getWorkSheet(Spreadsheet spreadsheet,
      {required String title}) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title);
    }
  }

  static saveResult(Result result) async {
    try {
      if (_worksheet != null) {
        _worksheet!.values.map.appendRow(result.toMap());
        noOfRowsInserted++;
      }
    } catch (e) {
      log("Error : ${e.toString()}");
    }
  }

  static Future<File> downloadSheet() async {
    final Directory directory =
        await Directory('/storage/emulated/0/Download/ScanCer')
            .create(recursive: true);
    DateTime d = DateTime.now();
    String filename =
        d.toString().split('.')[0].replaceAll(RegExp(r'[- :]'), '');
    filename = directory.path + '/Scancer-$filename.xlsx';
    File file = File(filename);
    spreadsheet.export(file, ExportFormat.xlsx);
    log("File saved to $filename");
    return file;
  }

  static viewSheet() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    String filename = directory.path + '/Scancer.xlsx';
    File file = File(filename);
    await spreadsheet.export(file, ExportFormat.xlsx);
    OpenFile.open(file.path);
  }
}
