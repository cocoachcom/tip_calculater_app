import 'package:flutter/material.dart';
import 'package:tip_calculater_app/pages/bill_tracker.dart';
import 'package:tip_calculater_app/pages/home.dart';
import 'package:tip_calculater_app/pages/tip_guide.dart';

class LeftSide extends StatefulWidget {
  @override
  _LeftSideState createState() => new _LeftSideState();
}

class _LeftSideState extends State<LeftSide> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        //TITLE
        Container(
          padding: EdgeInsets.all(15),
          child: Center(
            child: Text(
              'Tip Utility'.toUpperCase(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 2),
            ),
          ),
          decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1.0, color: Colors.grey.shade400),
                bottom: BorderSide(width: 1.0, color: Colors.grey.shade400),
              ),
              color: Color(0xffffffff)),
        ),

        //SPACER
        Container(
          padding: EdgeInsets.all(15),
        ),

        //TIP CALCULATOR
        Container(
            decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.grey.shade200),
                  bottom: BorderSide(width: 1.0, color: Colors.grey.shade200),
                ),
                color: Color(0xffffffff)),
            child: Center(
              child: ListTile(
                title: Text(
                  'Tip Calculator',
                  style: TextStyle(fontSize: 16),
                ),
                leading: new Icon(
                  Icons.exposure,
                  color: Colors.blue,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home())
                  );
                },
              ),
            )),

        //TIP GUIDE
        Container(
          decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1.0, color: Colors.grey.shade200),
                bottom: BorderSide(width: 1.0, color: Colors.grey.shade200),
              ),
              color: Color(0xffffffff)),
          child: ListTile(
            title: Text(
              'Tip Guide',
              style: TextStyle(fontSize: 16),
            ),
            leading: Icon(
              Icons.import_contacts,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TipGuide()));
            },
          ),
        ),
      ],
    );
  }
}