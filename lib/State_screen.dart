import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import "./ReviseAlarm.dart";
import "./Ingredient.dart";

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
                        width: 200,
                        height: 200,
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
                  Text(expiration_date,
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
                            builder: (context) =>
                                ReviseAlarm(name: name,
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
