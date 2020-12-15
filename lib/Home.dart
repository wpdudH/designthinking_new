import 'package:flutter/material.dart';
import './bottom_bar.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TabController controller;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: 4,
          child: Scaffold(
            body: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  Container(child: Center(child: Text('home'))), // home 누르면 나올 페이지
                  Container(child: Center(child: Text('alarm'))),  // alarm 누르면 나올 페이지
                  Container(child: Center(child: Text('recipe'))), // recipe 누르면 나올 페이지
                  Container(child: Center(child: Text('settings'))), // settings 누르면 나올 페이지
                ]),
            bottomNavigationBar: BottomBar(),
          )),
    );
  }
}