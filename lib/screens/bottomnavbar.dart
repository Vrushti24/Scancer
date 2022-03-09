import 'package:flutter/material.dart';
import 'package:scancer_app/screens/homepage.dart';
import 'package:scancer_app/screens/profile.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape:CircularNotchedRectangle(),
      notchMargin: 6.0,
      color: Colors.transparent,
      elevation: 9.0,
       clipBehavior: Clip.antiAlias,
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.0),
            topRight: Radius.circular(50.0)
          ),
          color: Colors.red
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.home_rounded, color: Colors.white), onPressed: (){
                     Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => HomePage()),
                                  );
                  }),
                  IconButton(icon: Icon(Icons.add_rounded, color:  Colors.white), onPressed: () {}) ,
                  IconButton(icon: Icon(Icons.person_rounded, color:  Colors.white), onPressed: () {
                    Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Profile()),
                                  );
                  })  
                ],
              )
            ),
          ]
        )
      )
    );
  }
}