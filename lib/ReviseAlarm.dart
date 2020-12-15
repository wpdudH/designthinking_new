import 'package:flutter/material.dart';
import './Listview.dart';

class ReviseAlarm extends StatefulWidget {
  String name;
  String expiration_date;
  String count;
  String image;

  ReviseAlarm({this.name, this.expiration_date, this.count, this.image});

  @override
  _ReviseAlarmState createState() => _ReviseAlarmState();
}

class _ReviseAlarmState extends State<ReviseAlarm> {
  String name;
  String expiration_date;
  String count;
  String image;

  List<String> dateTable = [
    '1days',
    '3days',
    '5days',
    '1Week',
  ];

  List<String> timeTable = [
    '1hours',
    '3hours',
    '5hours',
    '7hours',
  ];

  @override
  void initState() {
    super.initState();
    name = widget.name;
    expiration_date = widget.expiration_date;
    count = widget.count;
    image = widget.image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
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
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.check, size: 30),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Image.network(
                        image,
                        width: 150,
                        height: 150,
                        fit: BoxFit.contain),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[400],
                            offset: Offset(10.0, 1.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0,
                          ),
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(-4.0, -4.0),
                            blurRadius: 15.0,
                            spreadRadius: 1,
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      expiration_date,
                      style: TextStyle(
                        fontSize: 24,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(count, style: TextStyle(fontSize: 24)),
                ],
              ),
            ),
            Container(
                child: SizedBox(
                  height: 30,
                )),
            Container(
                child: Text(
                  "Select Date",
                  style: TextStyle(
                    color: Colors.blueGrey[500],
                    fontSize: 20,
                  ),
                )),
            Container(
              child: Listview(pick:dateTable),
            ),
            Container(
                child: SizedBox(
                  height: 30,
                )),
            Container(
                child: Text(
                  "Select Time",
                  style: TextStyle(
                    color: Colors.blueGrey[500],
                    fontSize: 20,
                  ),
                )),
            Container(
              child: Listview(pick:timeTable),
            ),
          ],
        ),
      ),
    ),
    );
  }
}

