import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tip_calculater_app/data/Settings.dart';
import 'package:tip_calculater_app/flutter_floating_bottom_navigation_bar-master/floating_navbar.dart';
import 'package:tip_calculater_app/flutter_floating_bottom_navigation_bar-master/floating_navbar_item.dart';
import 'package:tip_calculater_app/pages/home.dart';

Future<dynamic> loadJson() async {
  String data = await rootBundle.loadString('assets/data/settings.json');
  var jsonResult = await jsonDecode(data);
  return jsonResult;
}

class CustomizeTip extends StatefulWidget {
  @override
  _CustomizeTipState createState() => new _CustomizeTipState();
}

class _CustomizeTipState extends State<CustomizeTip> {
  int _index = 0;
  int custom_value = 10;
  int content1;
  int content2;
  int content3;
  int content4;
  int content5;
  String number;
  SharedPreferences prefs;
  int current_content;
  Settings settings;

  @override
  void initState(){
    super.initState();
    loadData();
  }

  void loadData() async {
    this.prefs = await SharedPreferences.getInstance();
    var settingContent  =  await loadJson() ;
    settings = Settings.fromJson(settingContent);

    if(!prefs.containsKey('content1')){
      setState(() {
        this.content1 = settings.tip_values.content1;
      });
    }else{
      setState(() {
        this.content1 = prefs.getInt('content1');
      });
    }

    if(!prefs.containsKey('content2')){
      setState(() {
        this.content2 = settings.tip_values.content2;
      });
    }else{
      setState(() {
        this.content2 = prefs.getInt('content2');
      });
    }

    if(!prefs.containsKey('content3')){
      setState(() {
        this.content3 = settings.tip_values.content3;
      });
    }else{
      setState(() {
        this.content3 = prefs.getInt('content3');
      });
    }

    if(!prefs.containsKey('content4')){
      setState(() {
        this.content4 = settings.tip_values.content4;
      });
    }else{
      setState(() {
        this.content4 = prefs.getInt('content4');
      });
    }

    if(!prefs.containsKey('content5')){
      setState(() {
        this.content5 = settings.tip_values.content5;
      });
    }else{
      setState(() {
        this.content5 = prefs.getInt('content5');
      });
    }

    current_content = content1;

//    TextController = TextEditingController(text: tax_rate.toString());
  }

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

    return new Scaffold(
      appBar: new AppBar(
        title: Text('Customize Tip Values', style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
//        leading: new IconButton(icon: new Icon(Icons.cancel), color: Colors.blue, iconSize: 30, onPressed: (){},),
        iconTheme: IconThemeData(
          color: Colors.blue
        ),
        actions: [
          new MaterialButton(
            onPressed: (){
              prefs.setInt('content1', content1);
              prefs.setInt('content2', content2);
              prefs.setInt('content3', content3);
              prefs.setInt('content4', content4);
              prefs.setInt('content5', content5);
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>Home())
              );
            },
            child: Text('Save', style: TextStyle(fontSize: 18, color: Colors.blue),),
          )
        ],
      ),

      body: new Container(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(15.0),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlineButton(
                    child: Text('Restore Default', style: TextStyle(fontSize: 20, color: Colors.blue),),
                    borderSide: BorderSide(color: Colors.blue),
                    onPressed: (){
                      setState(() {
                        content1 = 10;
                        content2 = 12;
                        content3 = 15;
                        content4 = 18;
                        content5 = 20;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15.0),
            ),

            //TAB BUTTON
            Container(
              padding: EdgeInsets.all(10.0),
              child: FloatingNavbar(
                onTap: (int val) {
                  switch (val) {
                    case 0:{custom_value = content1; current_content = content1;}break;
                    case 1:{custom_value = content2; current_content = content2;}break;
                    case 2:{custom_value = content3; current_content = content3;}break;
                    case 3:{custom_value = content4; current_content = content4;}break;
                    case 4:{custom_value = content5; current_content = content5;}break;
                    default:{}break;
                  }
                  setState(() => _index = val);
                },
                currentIndex: _index,
                items: [
                  FloatingNavbarItem(title: content1.toString()),
                  FloatingNavbarItem(title: content2.toString()),
                  FloatingNavbarItem(title: content3.toString()),
                  FloatingNavbarItem(title: content4.toString()),
                  FloatingNavbarItem(title: content5.toString()),
                ],
                allWidth: widthDevice-10,
              ),
            ),
            Container(
              padding: EdgeInsets.all(15.0),
            ),

            //INPUT
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 2, 10.0, 2),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2.0, color: const Color(0xFF999999)),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Container(
                      width: 60,
                      child: Text(
                        current_content.toString(),
                        style: TextStyle(fontSize: 24),
                        textAlign: TextAlign.center,
                      )
                    )
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 5, 10.0, 5),
                    child: Container(
                      width: 80,
                      height: 35,
                      child: TextField(
                        textAlign: TextAlign.center,
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
                          contentPadding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        ),
                        style: TextStyle(
                          fontSize: 18.0,
                          height: 1.2,
                        ),
                        onChanged: (val){
                          if (val == ''){
                            val = '0';
                          }
                          switch(_index){
                            case 0:
                              setState(() {
                                content1 = int.parse(val);
                                current_content = content1;
                              });
                              break;
                            case 1:
                              setState(() {
                                content2 = int.parse(val);
                                current_content = content2;
                              });
                              break;
                            case 2:
                              setState(() {
                                content3 = int.parse(val);
                                current_content = content3;
                              });
                              break;
                            case 3:
                              setState(() {
                                content4 = int.parse(val);
                                current_content = content4;
                              });
                              break;
                            case 4:
                              setState(() {
                                content5 = int.parse(val);
                                current_content = content5;
                              });
                              break;
                            default:
                              break;
                          }
                        },
                      ),
                    )
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

