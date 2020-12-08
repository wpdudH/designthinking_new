import 'package:flutter/material.dart';
import './State_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './Ingredient.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot> streamData;

  @override
  void initState() {
    super.initState();
    streamData = firestore.collection('ingredient').snapshots();
  }

  Widget _fetchData(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('ingredient').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();
          return _buildBody(context, snapshot.data.docs);
        });
  }


  Widget _buildBody(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Ingredient> ingredient_book =
        snapshot.map((d) => Ingredient.fromSnapshot(d)).toList();
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[State_screen(ingredient_book: ingredient_book)],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _fetchData(context);
  }
}
