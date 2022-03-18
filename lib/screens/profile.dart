import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    String? name = FirebaseAuth.instance.currentUser?.displayName;
    return Container(
      child: Row(
        children: <Widget>[
          if (name != null)
            Text(name,
                style: const TextStyle(
                  fontSize: 20,
                )),
        ],
      ),
      color: Colors.blue,
    );
  }
}
