import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tip_calculater_app/components/left_side.dart';
import 'package:tip_calculater_app/data/Guide.dart';

Future<dynamic> loadJson() async {
  String json_string = await rootBundle.loadString('assets/data/guide.json');
  var jsonResult = await jsonDecode(json_string);
  return jsonResult;
}

class TipGuide extends StatefulWidget {
  @override
  _TipGuideState createState() => _TipGuideState();
}

class EntryItem extends StatelessWidget {
  const EntryItem({this.entry});

  final Guide entry;

  Widget _buildTiles(Guide root) {
    if (root.countries.isEmpty) return ListTile(title: Text(root.countries));
    List<Widget> list = List();
    list.add(
      Container(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.0, color: Colors.grey.shade200),
                      bottom: BorderSide(width: 1.0, color: Colors.grey.shade200),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          'Restaurant',
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                      ),
                      Container(
                        child: Text(
                          root.restaurant,
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  )),
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.0, color: Colors.grey.shade200),
                      bottom: BorderSide(width: 1.0, color: Colors.grey.shade200),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Bartenders',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                      ),
                      Text(
                        root.bartenders,
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  )),
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.0, color: Colors.grey.shade200),
                      bottom: BorderSide(width: 1.0, color: Colors.grey.shade200),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'BarberHairdresser',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                      ),
                      Text(
                        root.barberHairdresser,
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  )),
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.0, color: Colors.grey.shade200),
                      bottom: BorderSide(width: 1.0, color: Colors.grey.shade200),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          'Massage',
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                      ),
                      Container(
                        child: Text(
                          root.massage,
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  )),
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.0, color: Colors.grey.shade200),
                      bottom: BorderSide(width: 1.0, color: Colors.grey.shade200),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Salon Spa',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                      ),
                      Text(
                        root.salonSpa,
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  )),
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.0, color: Colors.grey.shade200),
                      bottom: BorderSide(width: 1.0, color: Colors.grey.shade200),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'House keeping',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                      ),
                      Text(
                        root.housekeeping,
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  )
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.0, color: Colors.grey.shade200),
                      bottom: BorderSide(width: 1.0, color: Colors.grey.shade200),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Bell boys',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                      ),
                      Text(
                        root.bellboys,
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  )
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.0, color: Colors.grey.shade200),
                      bottom: BorderSide(width: 1.0, color: Colors.grey.shade200),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Taxi',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                      ),
                      Text(
                        root.taxi,
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  )
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.0, color: Colors.grey.shade200),
                      bottom: BorderSide(width: 1.0, color: Colors.grey.shade200),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Private Drivers',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                      ),
                      Text(
                        root.privateDrivers,
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  )
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.0, color: Colors.grey.shade200),
                      bottom: BorderSide(width: 1.0, color: Colors.grey.shade200),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Car Service',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                      ),
                      Text(
                        root.carService,
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  )
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.0, color: Colors.grey.shade200),
                      bottom: BorderSide(width: 1.0, color: Colors.grey.shade200),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tour Guide Group',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                      ),
                      Text(
                        root.tourGuideGroup,
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  )
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.0, color: Colors.grey.shade200),
                      bottom: BorderSide(width: 1.0, color: Colors.grey.shade200),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tour Guide Private',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                      ),
                      Text(
                        root.tourGuidePrivate,
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  )
              ),
            ],
          )),
    );
    return ExpansionTile(
      title: Text(root.countries),
      leading: Icon(Icons.play_arrow),
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}

class _TipGuideState extends State<TipGuide> {
  Guide item;
  List<Guide> guideList = new List<Guide>();
  List<Guide> items = new List<Guide>();
  List<Guide> duplicateItems = new List<Guide>();

  @override
  void initState() {
    super.initState();
    loadData();
  }


  void loadData() async {
    var json_content = await loadJson() as List;
    guideList = json_content.map((e) => Guide.fromJson(e)).toList();
    items.addAll(guideList);
  }

  void filterSearchResults(String query) {
    List<Guide> dummySearchList = List<Guide>();
    dummySearchList.addAll(guideList);
    if(query.isNotEmpty) {
      List<Guide> dummyListData = List<Guide>();
      dummySearchList.forEach((item) {
        if(item.countries.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(guideList);
      });
    }

  }



  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    var heightDevice = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Tip Guide',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.blue),
          backgroundColor: Colors.white,
        ),
        drawer: Drawer(
          child: LeftSide(),
        ),
        body: Container(
          color: Color(0xffcccccc),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Container(
                  width: widthDevice - 40,
                  height: 40,
                  child: TextField(
                    decoration: new InputDecoration(
                        filled: true,
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2.0), borderRadius: const BorderRadius.all(const Radius.circular(10.0))),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2.0), borderRadius: const BorderRadius.all(const Radius.circular(10.0))),
                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2.0), borderRadius: const BorderRadius.all(const Radius.circular(10.0))),
                        contentPadding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        fillColor: Colors.white),
                    style: TextStyle(
                      fontSize: 18.0,
                      height: 1.2,
                    ),
                    onChanged: (value){
                      filterSearchResults(value);
                    },
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                    color: Colors.white,
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) => EntryItem(
                        entry: items[index],
                      ),
                      itemCount: items.length,
                    ),
                  )
              )
            ],
          ),
        ));
  }
}



