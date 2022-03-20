import 'package:file_icon/file_icon.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

Widget fileView(PlatformFile file, double height) {
  final kb = file.size / 1024;
  final mb = kb / 1024;
  final filesize =
      mb >= 1 ? '${mb.toStringAsFixed(2)} MB' : '${kb.toStringAsFixed(2)} KB';
  return InkWell(
    onTap: () {
      OpenFile.open(file.path);
    },
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
      alignment: Alignment.center,
      constraints: BoxConstraints(maxHeight: height * 0.50),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white38),
        color: Colors.white12,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              text: file.name,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          FileIcon(
            file.name,
            size: height * 0.50 * 0.50,
          ),
          RichText(
            text: TextSpan(
              text: filesize,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    ),
  );
}
