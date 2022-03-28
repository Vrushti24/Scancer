import 'package:flutter/material.dart';
import 'package:scancer_app/util/API.dart';
import 'package:scancer_app/util/sheet.dart';
import 'package:scancer_app/widget/list_template.dart';

class VerifyData extends StatefulWidget {
  const VerifyData({Key? key}) : super(key: key);

  @override
  _VerifyDataState createState() => _VerifyDataState();
}

class _VerifyDataState extends State<VerifyData> {
  TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Verify",
        style: TextStyle(fontSize: 20),
      )),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      ListTemplete(
                          list: API.result!.toc, label: 'Type Of Certificate'),
                      ListTemplete(
                          list: API.result!.person, label: 'Name Of Recipient'),
                      ListTemplete(
                          list: API.result!.event,
                          label: 'Event/Topic/Given For'),
                      ListTemplete(list: API.result!.date, label: 'Date'),
                      ListTemplete(
                          list: API.result!.org, label: 'Organization'),
                      ListTemplete(
                          list: API.result!.official,
                          label: 'Signed By (Officials)'),
                      const SizedBox(
                        height: 80,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.all(20),
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.primaries.first,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: InkWell(
                  splashColor: Colors.green,
                  onTap: () {
                    Sheet.appendData(API.result!.toList());
                    Navigator.pop(context);
                    API.result = null;
                  },
                  borderRadius: BorderRadius.circular(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.done_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(width: 15),
                      Center(
                        child: Text(
                          'Done',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Andika',
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
