import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class Crawling extends StatelessWidget {
  String name;
  Crawling({this.name});

  @override
  Widget build(BuildContext context) {
    var title = 'Web Images';

    return Container(
      child: Column(
        children: <Widget>[
          Image.network('http://ch4n3.kr:3000/image?keyword=' + name, width: 50, height: 50, fit: BoxFit.contain),
        ],
      ),
    );
  }
}
