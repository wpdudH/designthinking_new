import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './bottom_bar.dart';
import './homeScreen.dart';
import './SearchScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchScreen(),
    );
  }
}

