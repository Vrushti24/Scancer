import 'dart:io';
import 'package:scancer_app/util/Result.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as excel;

class LocalSheet {
  static late final excel.Workbook workbook;
  static late final excel.Worksheet sheet;

  static void init() {
    workbook = excel.Workbook();
    sheet = workbook.worksheets[0];
    sheet.importList(Result.fields, 1, 1, false);
    sheet.autoFitRow(1);
    for (int i = 1; i < Result.fields.length + 1; i++) {
      sheet.autoFitColumn(i);
    }
  }

  static void appendData(List<String> values) {
    int rows = sheet.getLastRow() + 1;
    sheet.importList(values, rows == 0 ? 1 : rows, 1, false);
    sheet.autoFitRow(rows == 0 ? 1 : rows);
    for (int i = 1; i < values.length + 1; i++) {
      sheet.autoFitColumn(i);
    }
  }

  static Future<File> saveSheet() async {
    final List<int> bytes = workbook.saveAsStream();
    final Directory directory =
        await Directory('/storage/emulated/0/Download/ScanCer')
            .create(recursive: true);
    DateTime d = DateTime.now();
    String filename =
        d.toString().split('.')[0].replaceAll(RegExp(r'[- :]'), '');
    filename = directory.path + '/Scancer-$filename.xlsx';
    File file = File(filename);
    file = await file.writeAsBytes(bytes);
    return file;
  }
}
