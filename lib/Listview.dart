import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';

class Listview extends StatelessWidget {
  List<String> pick = new List<String>();

  Listview({this.pick});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: PickButton(pick),
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> PickButton(List<String> dataTable) {
  List<Widget> results = [];
  for (var i = 0; i < dataTable.length; i++) {
    results.add(InkWell(
        onTap: () {},
        child: Container(
            padding: EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            child: Container(
              width: 100,
              height: 40,
              child: Center(
                child: Text(
                  dataTable[i],
                  style: TextStyle(
                    color: Color(0xffA6BCD0),
                    fontSize: 16,
                  ),
                ),
              ),
              padding: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: Color(0xffF0F4F8),
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300],
                    offset: Offset(3.0, 3.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                  )
                ],
              ),
            ))));
  }
  return results;
}
