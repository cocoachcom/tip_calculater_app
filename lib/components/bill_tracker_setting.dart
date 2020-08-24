import 'package:flutter/material.dart';
import 'package:tip_calculater_app/components/left_side.dart';

class BillTrackerSetting extends StatefulWidget{
  @override
  _BillTrackerSettingState createState() => _BillTrackerSettingState();
}

class _BillTrackerSettingState extends State<BillTrackerSetting>{

  String venue = 'Unknown';



  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery
        .of(context)
        .size
        .width;
    var heightDevice = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
        appBar: AppBar(
          title: Text('Bill Tacker', style: TextStyle(color: Colors.black),),
          centerTitle: true,
          iconTheme: IconThemeData(
              color: Colors.blue,
              size: 20
          ),
          backgroundColor: Colors.white,
        ),

        body: new Container(
          color: Color(0xffeeeeee),
          child: ListView(
            children: [
              //SPACER
              Container(
                padding: EdgeInsets.all(15.0),
              ),

              //VENUE
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(width: 1.0, color: Colors.grey.shade300),
                    bottom: BorderSide(width: 1.0, color: Colors.grey.shade300),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Venue',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 60,
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 2.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 2.0),
                          ),
                          contentPadding: const EdgeInsets.fromLTRB(15, 2, 15, 2),
                        ),
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 22.0,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //SPACER
              Container(
                padding: EdgeInsets.all(15.0),
              ),

              //DATE
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(width: 1.0, color: Colors.grey.shade300),
                    bottom: BorderSide(width: 1.0, color: Colors.grey.shade300),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Date',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 60,
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 2.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 2.0),
                          ),
                          contentPadding: const EdgeInsets.fromLTRB(15, 2, 15, 2),
                        ),
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 22.0,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //SPACER
              Container(
                padding: EdgeInsets.all(15.0),
              ),

              //TOTAL
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(width: 1.0, color: Colors.grey.shade300),
                    bottom: BorderSide(width: 1.0, color: Colors.grey.shade300),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Total',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 60,
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 2.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 2.0),
                          ),
                          contentPadding: const EdgeInsets.fromLTRB(15, 2, 15, 2),
                        ),
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 22.0,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //SPACER
              Container(
                padding: EdgeInsets.all(15.0),
              ),

              //NOTES
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                child: Text('Notes'.toUpperCase(), style: TextStyle(fontSize: 18, color: Color(0xff666666)),),
              ),
              Container(
                  width: widthDevice-20,
                  height: 200,
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: Card(
                      color: Colors.white,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1.0),
                        ),
                        padding: EdgeInsets.all(15.0),
                        child: TextField(
                          maxLines: 150,
                          decoration: InputDecoration.collapsed(hintText: "Enter your text here"),
                        ),
                      )
                  )
              ),

              //SPACER
              Container(
                padding: EdgeInsets.all(20.0),
              ),
              //NOTES
              GestureDetector(
                onTap: (){

                },
                child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        top: BorderSide(width: 0.5, color: Colors.grey.shade200),
                        bottom: BorderSide(width: 1.0, color: Colors.grey.shade200),
                      ),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 200,
                          child: Text(
                            'View Receipt',
                            style: TextStyle(fontSize: 24,),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Icon(Icons.chevron_right, color: Colors.grey,)
                      ],
                    )
                ),
              ),

              //SPACER
              Container(
                padding: EdgeInsets.all(20.0),
              ),
              //NOTES
              GestureDetector(
                onTap: (){

                },
                child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        top: BorderSide(width: 0.5, color: Colors.grey.shade200),
                        bottom: BorderSide(width: 1.0, color: Colors.grey.shade200),
                      ),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 200,
                          child: Text(
                            'Email',
                            style: TextStyle(fontSize: 24, ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Icon(Icons.chevron_right, color: Colors.grey)
                      ],
                    )
                ),
              )

            ],
          ),
        )
    );
  }
}