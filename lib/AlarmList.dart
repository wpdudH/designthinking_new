import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './Compare_date.dart';

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
    FirebaseFirestore.instance.collection('User').get().then((QuerySnapshot querySnapshot) => {
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
                  IconButton(
                    icon: Icon(Icons.arrow_right, size: 30),
                    onPressed: () {},
                  ),
                  Text(
                    "Expiration Date",
                    style: TextStyle(
                      color: Colors.blueGrey[500],
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
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
                  Container(
                    height: 550,
                    padding: EdgeInsets.fromLTRB(10, 30, 10, 20),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: ExpirationDateList(makeList(foodExpiration), foodExpiration),
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

List<String> makeList(Map<String, List<String>> foodExpiration)
{
  List<String> timeTable = [];
  for (var element in foodExpiration.keys)
  {
    timeTable.add(element);
  }
  return timeTable;
}


List<Widget> ExpirationDateList(List<String> timeTable, Map<String, List<String>> foodExpiration)
{
  sortDay(timeTable);
  List<Widget> results = [];
  for (int i = 0; i < timeTable.length;i++)
    {
      List<String> data = foodExpiration[timeTable[i]];
      results.add(
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              color:Colors.lightBlueAccent[100],
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            width: 300,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.network(
                  data[1], width: 60, height: 60, fit: BoxFit.contain
                ),
                Text(
                  data[0],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                Text(
                  timeTable[i],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                Text(
                  "D",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
      );
    }

  return results;
}
