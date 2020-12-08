import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Container(
            height: 100,
            child: TabBar(tabs: <Widget>[
              Tab(
                  icon: Icon(
                Icons.home,
                color: Colors.blue[100],
                size: 50,
              )),
              Tab(
                  icon: Icon(
                Icons.access_alarm,
                color: Colors.blue[100],
                size: 50,
              )),
              Tab(
                  icon: Icon(
                Icons.list,
                color: Colors.blue[100],
                size: 50,
              )),
              Tab(
                  icon: Icon(
                Icons.settings,
                color: Colors.blue[100],
                size: 50,
              )),
            ])));
  }
}
