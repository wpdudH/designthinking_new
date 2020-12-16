import 'package:flutter/material.dart';
import './Listview.dart';
import './ReviseHome.dart';

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
                padding: const EdgeInsets.only(top: 20, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.backspace),
                      color: Colors.grey[300],
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 50),
                      child: Text(
                        'Alarm Setting',
                        style: TextStyle(
                          fontFamily: 'Acumin Pro SemiCondensed',
                          fontSize: 25,
                          color: const Color(0xff748a9d),
                          letterSpacing: -0.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.check, size: 30),
                      color: Colors.grey[300],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReviseHome(name)),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Image.network(image,
                          width: 200, height: 200, fit: BoxFit.contain),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: const Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x12000000),
                            offset: Offset(0, 5),
                            blurRadius: 30,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(name,
                        style: TextStyle(
                          fontFamily: 'Acumin Pro SemiCondensed',
                          fontSize: 25,
                          color: const Color(0xff748a9d),
                          letterSpacing: -0.2,
                        )),
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
                child: Listview(pick: dateTable),
              ),
              Container(
                  child: SizedBox(
                height: 10,
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
                child: Listview(pick: timeTable),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
