import 'package:designthinking_new/Home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './SearchScreen.dart';
import 'curegister.dart';
import 'mainpage.dart';
import 'mmainpage.dart';
import 'Home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    DocumentView1.tag: (context) => DocumentView1(),
    SearchScreen.tag: (context) => SearchScreen(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
