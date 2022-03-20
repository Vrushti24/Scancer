// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:scancer_app/util/API.dart';

class ListTemplete extends StatefulWidget {
  List<String> list;
  String label;
  ListTemplete({
    Key? key,
    required this.list,
    required this.label,
  }) : super(key: key);

  @override
  State<ListTemplete> createState() => _ListTempleteState();
}

class _ListTempleteState extends State<ListTemplete> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.label,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                ),
                IconButton(
                  onPressed: () {
                    widget.list.add('');
                    setState(() {});
                    log(API.result.toString());
                  },
                  icon: Icon(Icons.add, color: Colors.primaries.first),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.list.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (text) {
                  widget.list[index] = text.trim();
                  log(API.result.toString());
                },
                initialValue: widget.list[index],
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      widget.list.remove(widget.list[index]);
                      setState(() {});
                      log(API.result.toString());
                    },
                    icon: Icon(
                      Icons.remove,
                      color: Colors.primaries.first,
                      size: 20,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white24,
                  focusColor: Colors.white,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),
                  labelStyle: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
