import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import "./ReviseAlarm.dart";
import "./Ingredient.dart";
import 'package:adobe_xd/adobe_xd.dart';
import 'Home.dart';

class State_screen extends StatefulWidget {
  final List<String> ingredient_book;
  State_screen(this.ingredient_book);

  _State_screenState createState() => _State_screenState();
}

class _State_screenState extends State<State_screen> {
  List<String> ingredient_book;
  String name;
  String expiration_date;
  String count;
  String image;

  @override
  void initState() {
    super.initState();
    ingredient_book = widget.ingredient_book;
    name = ingredient_book[0];
    expiration_date = ingredient_book[1];
    image = ingredient_book[3];
    count = ingredient_book[2];
  }

  Widget build(BuildContext context) {
    return Container(
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
                      'Revise',
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
                        MaterialPageRoute(builder: (context) => Home()),
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
                  SizedBox(
                    height: 10,
                  ),
                  Text(expiration_date,
                      style: TextStyle(
                        fontFamily: 'Acumin Pro SemiCondensed',
                        fontSize: 25,
                        color: const Color(0xff748a9d),
                        letterSpacing: -0.2,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(count,
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
              height: 20,
            )),
            Container(
              child: Scroll_menu(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget Scroll_menu(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReviseAlarm(
                                name: name,
                                expiration_date: expiration_date,
                                count: count,
                                image: image)));
                  },
                  child: Container(
                    padding: EdgeInsets.only(right: 10),
                    alignment: Alignment.centerLeft,
                    child: Image.asset('assets/images/AlarmSetting.png'),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.only(right: 10),
                    alignment: Alignment.centerLeft,
                    child: Image.asset('assets/images/DateChange.png'),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.only(right: 10),
                    alignment: Alignment.centerLeft,
                    child: Image.asset('assets/images/More.png'),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.only(right: 10),
                    alignment: Alignment.centerLeft,
                    child: Image.asset('assets/images/QuantityChange.png'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
