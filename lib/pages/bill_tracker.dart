import 'package:flutter/material.dart';
import 'package:tip_calculater_app/components/bill_tracker_setting.dart';
import 'package:tip_calculater_app/components/left_side.dart';


class BillTracker extends StatefulWidget{
  @override
  _BillTrackerState createState() => _BillTrackerState();
}

class _BillTrackerState extends State<BillTracker>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BillTracker', style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.blue
        ),
      ),
      drawer: Drawer(
        child: LeftSide(),
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BillTrackerSetting()
                  )
              );
            },
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.grey.shade200),
                  bottom: BorderSide(width: 1.0, color: Colors.grey.shade200),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          height: 60.0,
                          width: 80.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://www.publicdomainpictures.net/pictures/320000/velka/background-image.png'),
                              fit: BoxFit.fill,
                            ),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Unknown', style: TextStyle(fontSize: 22),textAlign: TextAlign.left,),
                              Text('Jan, 28, 2020', style: TextStyle(fontSize: 18, color: Colors.grey),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('57:50', style: TextStyle(fontSize: 22),),
                        Text('12:22 PM', style: TextStyle(fontSize: 18, color: Colors.grey),),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}