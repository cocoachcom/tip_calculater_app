import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tip_calculater_app/data/Settings.dart';
import 'package:tip_calculater_app/components/left_side.dart';
import 'package:tip_calculater_app/components/right_side.dart';
import 'package:tip_calculater_app/flutter_floating_bottom_navigation_bar-master/floating_navbar.dart';
import 'package:tip_calculater_app/flutter_floating_bottom_navigation_bar-master/floating_navbar_item.dart';
import 'package:tip_calculater_app/pages/cutomize_tip_values.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<dynamic> loadJson() async {
  String data = await rootBundle.loadString('assets/data/settings.json');
  var jsonResult = await jsonDecode(data);
  return jsonResult;
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool split_bill = true;
  double roundingWidth = 200;
  double Result = 0.00;
  int _index = 0;
  int tip = 10;

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
  int selected_tip = 10;
  double sub_total = 0;
  double tip_person = 0;
  double tip_total = 0;
  double total_person = 0;
  double total = 0;

  double currentSliderValue = 1;
  SharedPreferences prefs;

  int atm;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    this.prefs = await SharedPreferences.getInstance();
    var settingContent = await loadJson();
    Settings settings = Settings.fromJson(settingContent);

    if (!prefs.containsKey('tax_rate')) {
      setState(() {
        this.tax_rate = settings.tax_rate;
      });
    } else {
      setState(() {
        this.tax_rate = prefs.getInt('tax_rate');
      });
    }

    if (!prefs.containsKey('exclude_tax')) {
      setState(() {
        this.exclude_tax = settings.exclude_tax;
      });
    } else {
      setState(() {
        this.exclude_tax = prefs.getBool('exclude_tax');
      });
    }

    if (!prefs.containsKey('display_tax')) {
      setState(() {
        this.display_tax = settings.display_tax;
      });
    } else {
      setState(() {
        this.display_tax = prefs.getBool('display_tax');
      });
    }

    if (!prefs.containsKey('atm_text_entry')) {
      setState(() {
        this.atm_text_entry = settings.atm_text_entry;
      });
    } else {
      setState(() {
        this.atm_text_entry = prefs.getBool('atm_text_entry');
      });
    }

    if (!prefs.containsKey('show_keybody')) {
      setState(() {
        this.show_keybody = settings.show_keybody;
      });
    } else {
      setState(() {
        this.show_keybody = prefs.getBool('show_keybody');
      });
    }

    if (!prefs.containsKey('index')) {
      setState(() {
        this.index = settings.index;
      });
    } else {
      setState(() {
        this.index = prefs.getInt('index');
      });
    }

    if (!prefs.containsKey('content1')) {
      setState(() {
        this.content1 = settings.tip_values.content1;
      });
    } else {
      setState(() {
        this.content1 = prefs.getInt('content1');
      });
    }

    if (!prefs.containsKey('content2')) {
      setState(() {
        this.content2 = settings.tip_values.content2;
      });
    } else {
      setState(() {
        this.content2 = prefs.getInt('content2');
      });
    }

    if (!prefs.containsKey('content3')) {
      setState(() {
        this.content3 = settings.tip_values.content3;
      });
    } else {
      setState(() {
        this.content3 = prefs.getInt('content3');
      });
    }

    if (!prefs.containsKey('content4')) {
      setState(() {
        this.content4 = settings.tip_values.content4;
      });
    } else {
      setState(() {
        this.content4 = prefs.getInt('content4');
      });
    }

    if (!prefs.containsKey('content5')) {
      setState(() {
        this.content5 = settings.tip_values.content5;
      });
    } else {
      setState(() {
        this.content5 = prefs.getInt('content5');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
//    var heightDevice = MediaQuery.of(context).size.height;

    if (exclude_tax == true) {
      tip_total = (((sub_total - ((sub_total / 100) * tax_rate)) / 100) * selected_tip);
    } else {
      tip_total = ((sub_total / 100) * selected_tip);
    }
    if (split_bill == true) {
      tip_person = (tip_total / currentSliderValue);
      total_person = (sub_total + tip_total) / currentSliderValue;
    } else {
      tip_person = tip_total;
      total_person = sub_total + tip_total;
    }
    total = sub_total + tip_total;

    if (atm_text_entry) {
      atm = 0;
    } else {
      atm = 2;
    }

    return new Scaffold(
        //KEY
        key: _scaffoldKey,

        //APP BAR
        appBar: new AppBar(
          title: Container(
            child: Column(
              children: [
                Text(
                  'Tip Calculator',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                  ),
                ),
                Text(
                  'pull down for calculator',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: new IconButton(icon: new Icon(Icons.menu), color: Colors.blueAccent, iconSize: 24, onPressed: () => _scaffoldKey.currentState.openDrawer()),
          actions: [new IconButton(icon: new Icon(Icons.settings), color: Colors.blueAccent, iconSize: 24, onPressed: () => _scaffoldKey.currentState.openEndDrawer())],
        ),

        //LEFT NAV
        drawer: new Drawer(child: LeftSide()),

        //RIGHT SETTING
        endDrawer: new Drawer(
          child: Container(
            color: Color(0xffeeeeee),
            child: RightSide(),
          ),
        ),

        //BODY
        body: new Container(
          color: Color(0xfff0f0f0),
          child: new ListView(
            children: [
              //SPACER
              Container(
                padding: EdgeInsets.all(15.0),
              ),

              //SUBTOTAL INPUT
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
                        'Subtotal',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 65,
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
                        onChanged: (content) {
                          print(content);
                          content == ''
                              ? setState(() {
                                  Result = 0;
                                  sub_total = Result;
                                })
                              : setState(() {
                                  double price = double.parse(content);
                                  sub_total = price;
                                });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              //SPACER
              Container(
                padding: EdgeInsets.all(15.0),
              ),

              //TIP
              Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(7.5, 10, 7.5, 10),
                child: Container(
                  padding: EdgeInsets.only(bottom: 0.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 20),
                            child: Text(
                              'Tip',
                              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                                decoration: BoxDecoration(border: Border.all(width: 1.8, color: const Color(0xFFcccccc)), borderRadius: BorderRadius.circular(7.0)),
                                child: Text(
                                  selected_tip.toString(),
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                                child: Text(
                                  '%',
                                  style: TextStyle(fontSize: 22),
                                ),
                              )
                            ],
                          ),
                          Container()
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                      ),
                      FloatingNavbar(
                        onTap: (int val) {
                          switch (val) {
                            case 0:
                              {
                                tip = content1;
                              }
                              break;
                            case 1:
                              {
                                tip = content2;
                              }
                              break;
                            case 2:
                              {
                                tip = content3;
                              }
                              break;
                            case 3:
                              {
                                tip = content4;
                              }
                              break;
                            case 4:
                              {
                                tip = content5;
                              }
                              break;
                            default:
                              {
                                tip = content1;
                              }
                              break;
                          }

                          setState(() {
                            _index = val;
                            selected_tip = tip;
                          });
                        },
                        currentIndex: _index,
                        items: [
                          FloatingNavbarItem(title: content1.toString()),
                          FloatingNavbarItem(title: content2.toString()),
                          FloatingNavbarItem(title: content3.toString()),
                          FloatingNavbarItem(title: content4.toString()),
                          FloatingNavbarItem(title: content5.toString()),
                        ],
                        allWidth: widthDevice - 20,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(((sub_total / 100) * content1).toStringAsFixed(atm)),
                            Text(((sub_total / 100) * content2).toStringAsFixed(atm)),
                            Text(((sub_total / 100) * content3).toStringAsFixed(atm)),
                            Text(((sub_total / 100) * content4).toStringAsFixed(atm)),
                            Text(((sub_total / 100) * content5).toStringAsFixed(atm)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              //SPACER
              Container(
                padding: EdgeInsets.all(15.0),
              ),
              //SPLIT BILL
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 5, 15.0, 5),
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
                    Text(
                      'Split Bill',
                      style: TextStyle(fontSize: 24),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(15, 10, 15, 5),
                          decoration: BoxDecoration(border: Border.all(width: 1.8, color: const Color(0xFFcccccc)), borderRadius: BorderRadius.circular(7.0)),
                          child: Text(
                            currentSliderValue.toInt().toString(),
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text(
                            ' ways',
                            style: TextStyle(fontSize: 22),
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: 60,
                      height: 20,
                      child: Switch(
                          value: split_bill,
                          onChanged: (value) {
                            setState(() {
                              split_bill = value;
                              print(split_bill);
                            });
                          },
                          activeTrackColor: Colors.green,
                          activeColor: Colors.white),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 5, 15.0, 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(width: 1.0, color: Colors.grey.shade300),
                    bottom: BorderSide(width: 1.0, color: Colors.grey.shade300),
                  ),
                ),
                child: Slider(
                  value: currentSliderValue,
                  min: 1,
                  max: 15,
                  divisions: 14,
                  label: currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      currentSliderValue = value;
                    });
                  },
                ),
              ),
              //SPACER
              Container(
                padding: EdgeInsets.all(15.0),
              ),

              //SUBTOTAL INPUT
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(width: 0.2, color: Colors.grey.shade300),
                    bottom: BorderSide(width: 0.2, color: Colors.grey.shade300),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Tip/Person',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Container(
                        width: 150,
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          tip_person.toStringAsFixed(atm),
                          style: TextStyle(fontSize: 25),
                          textAlign: TextAlign.end,
                        )),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(width: 0.2, color: Colors.grey.shade300),
                    bottom: BorderSide(width: 0.2, color: Colors.grey.shade300),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Tip Total',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Container(
                        width: 150,
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          tip_total.toStringAsFixed(atm),
                          style: TextStyle(fontSize: 25),
                          textAlign: TextAlign.end,
                        )
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(width: 0.2, color: Colors.grey.shade300),
                    bottom: BorderSide(width: 0.2, color: Colors.grey.shade300),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Total/Person',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Container(
                        width: 150,
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          total_person.toStringAsFixed(atm),
                          style: TextStyle(fontSize: 25),
                          textAlign: TextAlign.end,
                        )
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(width: 0.2, color: Colors.grey.shade300),
                    bottom: BorderSide(width: 0.2, color: Colors.grey.shade300),
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
                        width: 150,
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          total.toStringAsFixed(atm),
                          style: TextStyle(fontSize: 25),
                          textAlign: TextAlign.end,
                        )),
                  ],
                ),
              ),
              display_tax == true
                  ? Container(
                      padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(width: 0.2, color: Colors.grey.shade300),
                          bottom: BorderSide(width: 0.2, color: Colors.grey.shade300),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              'Tax',
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                          Container(
                              width: 150,
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                tax_rate.toString() + ' %',
                                style: TextStyle(fontSize: 25),
                                textAlign: TextAlign.end,
                              )),
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        )
    );
  }
}
