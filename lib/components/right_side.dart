import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tip_calculater_app/data/Settings.dart';
import 'package:tip_calculater_app/flutter_floating_bottom_navigation_bar-master/floating_navbar.dart';
import 'package:tip_calculater_app/flutter_floating_bottom_navigation_bar-master/floating_navbar_item.dart';
import 'package:tip_calculater_app/pages/cutomize_tip_values.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tip_calculater_app/pages/home.dart';


Future<dynamic> loadJson() async {
  String data = await rootBundle.loadString('assets/data/settings.json');
  var jsonResult = await jsonDecode(data);
  return jsonResult;
}


class RightSide extends StatefulWidget {
  @override
  _RightSideState createState() => new _RightSideState();
}

class _RightSideState extends State<RightSide> {

  int tax_rate;
  bool exclude_tax;
  bool display_tax;
  bool atm_text_entry;
  bool show_keybody;
  String rounding;
  int index;
  int content1;
  int content2;
  int content3;
  int content4;
  int content5;
  double roundingWidth = 200;
  SharedPreferences prefs;
  TextEditingController TextController;

  @override
  void initState(){
    super.initState();
    loadData();
  }

  void loadData() async {
    this.prefs = await SharedPreferences.getInstance();
    var settingContent  =  await loadJson() ;
    Settings settings = Settings.fromJson(settingContent);

    if(!prefs.containsKey('tax_rate')){
      setState(() {
        this.tax_rate = settings.tax_rate;
      });
    }else{
      setState(() {
        this.tax_rate = prefs.getInt('tax_rate');
      });

    }

    if(!prefs.containsKey('exclude_tax')){
      setState(() {
        this.exclude_tax = settings.exclude_tax;
      });
    }else{
      setState(() {
        this.exclude_tax = prefs.getBool('exclude_tax');
      });
    }

    if(!prefs.containsKey('display_tax')){
      setState(() {
        this.display_tax = settings.display_tax;
      });
    }else{
      setState(() {
        this.display_tax = prefs.getBool('display_tax');
      });
    }

    if(!prefs.containsKey('atm_text_entry')){
      setState(() {
        this.atm_text_entry = settings.atm_text_entry;
      });
    }else{
      setState(() {
        this.atm_text_entry = prefs.getBool('atm_text_entry');
      });
    }

    if(!prefs.containsKey('show_keybody')){
      setState(() {
        this.show_keybody = settings.show_keybody;
      });
    }else{
      setState(() {
        this.show_keybody = prefs.getBool('show_keybody');
      });
    }

    if(!prefs.containsKey('index')){
      setState(() {
        this.index = settings.index;
      });
    }else{
      setState(() {
        this.index = prefs.getInt('index');
      });
    }

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

    TextController = TextEditingController(text: tax_rate.toString());
  }

  Widget build(BuildContext context) {

    return ListView(
      children: [
        //TITLE
        Container(
          padding: EdgeInsets.all(15),
          child: Center(
            child: Text(
              'Settings'.toUpperCase(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 2, color: Colors.black),
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
          padding: EdgeInsets.all(5),
        ),

        //TAX RATE
        Container(
          decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1.0, color: Colors.grey.shade200),
                bottom: BorderSide(width: 0, color: Colors.grey.shade200),
              ),
              color: Color(0xffffffff)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Tax Rate',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 5, 10.0, 5),
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 35,
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
                          contentPadding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        ),
                        style: TextStyle(
                          fontSize: 18.0,
                          height: 1.2,
                        ),
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                        controller: TextController,
                        onChanged: (val){
                          int value = int.parse(val);
                          prefs.setInt('tax_rate', value);
                        },
                      ),
                    ),
                    Text(
                      '%',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(width: 0.5, color: Colors.grey.shade200),
                  bottom: BorderSide(width: 1.0, color: Colors.grey.shade200),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>Home())
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          'Calculate Tax Rate',
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(Icons.chevron_right)
                      ],
                    ),
                  )
                ],
              )
        ),


        //Exclude Tax from tip
        Container(
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
              Column(
                children: [
                  Text(
                    'Exclude Tax from Tip',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Tip=(Subtotal - Tax) x Tip %',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
              Container(
                width: 60,
                height: 20,
                child: Switch(
                    value: exclude_tax,
                    onChanged: (value) {
                      setState(() {
                        exclude_tax = value;
                        prefs.setBool('exclude_tax', value);
                        print('setted exclude_tax');
                      });
                    },
                    activeTrackColor: Colors.green.shade100,
                    activeColor: Colors.green),
              ),
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Exclude Tax From Tip: Subtract tax from subtotal before calculating tip.',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 14),
            )),
        //SPACER
        Container(
          padding: EdgeInsets.all(5),
        ),

        //Rounding
        Container(
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
              Text(
                'Rounding',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Container(
                width: roundingWidth,
                child: FloatingNavbar(
                  onTap: (int val) {
                    switch (val) {
                      case 0:
                        {
                          rounding = "none";
                        }
                        break;
                      case 1:
                        {
                          rounding = "tip";
                        }
                        break;
                      case 2:
                        {
                          rounding = "total";
                        }
                        break;
                      default:
                        {}
                        break;
                    }
                    setState(() => index = val);
                    prefs.setInt('index', val);
                    prefs.setString('rounding', rounding);
                  },
                  currentIndex: index,
                  items: [
                    FloatingNavbarItem(title: 'none'),
                    FloatingNavbarItem(title: 'tip'),
                    FloatingNavbarItem(title: 'total'),
                  ],
                  allWidth: roundingWidth,
                ),
              ),
            ],
          ),
        ),
        //SPACER
        Container(
          padding: EdgeInsets.all(5),
        ),

        //ADDITIONAL FIELDS
        Container(
            padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 5),
            child: Text(
              'ADDITIONAL FIELDS',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 14),
            )),
        Container(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Display Tax Field',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Tax assumed to be in subtotal, or no tax',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
              Container(
                width: 60,
                height: 20,
                child: Switch(
                    value: display_tax,
                    onChanged: (value) {
                      setState(() {
                        display_tax = value;
                        prefs.setBool('display_tax', value);
                        print(display_tax);
                      });
                    },
                    activeTrackColor: Colors.green.shade100,
                    activeColor: Colors.green),
              ),
            ],
          ),
        ),
        //SPACER
        Container(
          padding: EdgeInsets.all(5),
        ),

        //Text Field/Keyboard options
        Container(
            padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 5),
            child: Text(
              'Text field/keyboard options'.toUpperCase(),
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 14),
            )),
        Container(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ATM Text Entry Style',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Enter numbers without using decimal',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
              Container(
                width: 60,
                height: 20,
                child: Switch(
                    value: atm_text_entry,
                    onChanged: (value) {
                      setState(() {
                        atm_text_entry = value;
                        prefs.setBool('atm_text_entry', value);
                        print(atm_text_entry);
                      });
                    },
                    activeTrackColor: Colors.green.shade100,
                    activeColor: Colors.green),
              ),
            ],
          ),
        ),
        //Show Keyboard
        Container(
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
                width: 205,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Show Keyboard Done Button',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Display done button to dismiss keyboard',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              ),
              Container(
                width: 60,
                height: 20,
                child: Switch(
                    value: show_keybody,
                    onChanged: (value) {
                      setState(() {
                        show_keybody = value;
                        prefs.setBool('show_keybody', value);
                        print(show_keybody);
                      });
                    },
                    activeTrackColor: Colors.green.shade100,
                    activeColor: Colors.green),
              ),
            ],
          ),
        ),
        //SPACER
        Container(
          padding: EdgeInsets.all(5),
        ),

        //OTHER OPTION
        Container(
            padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 5),
            child: Text(
              'Other options'.toUpperCase(),
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 14),
            )),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CustomizeTip()));
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Customize Tip Values',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        Text(
                          'Specify what tip values display in the tip segmented control',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.chevron_right)
                ],
              )),
        )
      ],
    );
  }
}
