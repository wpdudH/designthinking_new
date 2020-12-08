import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            height: 120,
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
          padding: EdgeInsets.only(right: 5),
          alignment: Alignment.centerLeft,
          child: Image.asset('assets/images/' + image[i],
              width: 200, height: 200, fit: BoxFit.contain),
        )));
  }
  return results;
}
