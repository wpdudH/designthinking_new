import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './Compare_date.dart';
import 'package:adobe_xd/adobe_xd.dart';
import 'package:flutter/cupertino.dart';
import './Message.dart';

class AlarmList extends StatefulWidget {
  @override
  _AlarmListState createState() => _AlarmListState();
}

class _AlarmListState extends State<AlarmList> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot> currentStream;
  Map<String, List<String>> foodExpiration = Map();
  Iterable<String> key;
  List<String> timeTable = [];

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('User')
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                List<String> data = [];
                data.add(doc["name"]);
                data.add(doc["image_network"]);
                foodExpiration[doc["expiration_date"]] = data;
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 40, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Opacity(
                    opacity: 0.0,
                    child: IconButton(
                      icon: Icon(Icons.arrow_right, size: 30),
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 50),
                    child: Text(
                      'Expiration Date',
                      style: TextStyle(
                        fontFamily: 'Acumin Pro SemiCondensed',
                        fontSize: 25,
                        color: const Color(0xff748a9d),
                        letterSpacing: -0.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Opacity(
                    opacity: 0.0,
                    child: Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.check, size: 30),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  CupertinoButton(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Color(0xff99B5DF),
                    child: Text('Alarm talk'),
                    onPressed: () {
                      showNotification('d', 'd');
                    },
                  ),
                  Container(
                    height: 425,
                    padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: ExpirationDateList(
                          makeList(foodExpiration), foodExpiration),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> makeList(Map<String, List<String>> foodExpiration) {
  List<String> timeTable = [];
  for (var element in foodExpiration.keys) {
    timeTable.add(element);
  }
  return timeTable;
}

List<Widget> ExpirationDateList(
    List<String> timeTable, Map<String, List<String>> foodExpiration) {
  sortDay(timeTable);
  List<Widget> results = [];
  for (int i = 0; i < timeTable.length; i++) {
    String day = CompareDate(timeTable[i]);
    List<String> data = foodExpiration[timeTable[i]];
    results.add(
      Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
            color: Color(0xffDBE2ED),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        width: 300,
        height: 80,
        child: Row(
          children: <Widget>[
            Image.network(data[1], width: 60, height: 60, fit: BoxFit.contain),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                data[0],
                style: TextStyle(
                  color: Color(0xff748A9D),
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40),
              child: Text(
                timeTable[i],
                style: TextStyle(
                  color: Color(0xffA6BCD0),
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                "D" + day,
                style: TextStyle(
                  color: Color(0xff748A9D),
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  return results;
}
