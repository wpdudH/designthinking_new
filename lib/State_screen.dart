import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import "./Ingredient.dart";

class State_screen extends StatefulWidget {
  final List<Ingredient> ingredient_book;
  State_screen({this.ingredient_book});

  _State_screenState createState() => _State_screenState();
}

class _State_screenState extends State<State_screen> {
  List<Ingredient> ingredient_book;
  List<String> names;
  List<String> expiration_dates;
  List<String> counts;

  @override
  void initState() {
    super.initState();
    ingredient_book = widget.ingredient_book;
    names = ingredient_book.map((m) => m.name).toList();
    expiration_dates = ingredient_book.map((m) => m.expiration_date).toList();
    counts = ingredient_book.map((m) => m.count).toList();
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
                    names[0],
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
                    child: Image.asset('assets/images/' + names[0]+'.png',
                        width: 200, height: 200, fit: BoxFit.contain),
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
                  Text(expiration_dates[0],
                      style: TextStyle(
                        fontSize: 24,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(counts[0], style: TextStyle(fontSize: 24)),
                ],
              ),
            ),
            Container(
                child: SizedBox(
              height: 30,
            )),
            Container(
              child: Scroll_menu(),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> image = [
  'AlarmSetting.png',
  'DateChange.png',
  'More.png',
  'QuantityChange.png'
];

class Scroll_menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: makeMenuButton(image),
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> makeMenuButton(List<String> image) {
  List<Widget> results = [];
  for (var i = 0; i < 4; i++) {
    results.add(InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.only(right: 10),
          alignment: Alignment.centerLeft,
          child: Image.asset('assets/images/' + image[i]),
        )));
  }
  return results;
}
