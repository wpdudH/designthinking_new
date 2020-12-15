import 'package:flutter/material.dart';
import './State_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReviseHome extends StatefulWidget {
  String name;
  ReviseHome(this.name);

  @override
  _ReviseHomeState createState() => _ReviseHomeState();
}

class _ReviseHomeState extends State<ReviseHome> {
  String name;
  String food;
  String expiration_date;
  String count;
  String image;
  List<String> ingredient_book = [];

  @override
  void initState() {
    super.initState();
    name = widget.name;
  }

  @override
  Widget build_body(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection("User");

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(name).get(),
      // ignore: missing_return
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          food = data["name"];
          expiration_date = data["expiration_date"];
          count = data["count"];
          image = data["image_network"];
          ingredient_book.add(food);
          ingredient_book.add(expiration_date);
          ingredient_book.add(count);
          ingredient_book.add(image);
          return Revise(context);
        }
        return Text("Good");
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return build_body(context);
  }

  @override
  Widget Revise(BuildContext context) {
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            State_screen(ingredient_book),
          ],
        ),
      ],
    );
  }

}


