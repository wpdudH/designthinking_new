import 'package:flutter/material.dart';
import 'mmainpage.dart';
import 'AlarmList.dart';

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
          length: 3,
          child: Scaffold(
            body: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  Container(child: DocumentView1()), // home 누르면 나올 페이지
                  Container(child: AlarmList()), // alarm 누르면 나올 페이지
                  Container(
                      child:
                          Center(child: Text('recipe'))), // recipe 누르면 나올 페이지
// settings 누르면 나올 페이지
                ]),
            bottomNavigationBar: BottomBar(),
          )),
    );
  }
}

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
                Icons.home_rounded,
                color: const Color(0xff748A9D),
                size: 40,
              )),
              Tab(
                  icon: Icon(
                Icons.access_alarms_rounded,
                color: const Color(0xff748A9D),
                size: 40,
              )),
              Tab(
                  icon: Icon(
                Icons.reorder_rounded,
                color: const Color(0xff748A9D),
                size: 40,
              )),
            ])));
  }
}
