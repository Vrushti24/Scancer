import 'package:flutter/material.dart';

ElevatedButton getButton(String lable, Function()? fun, IconData icon) {
  return ElevatedButton.icon(
    onPressed: fun,
    icon: Icon(
      icon,
      size: 22,
    ),
    label: Container(
      width: 130,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Text(
        lable,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}
