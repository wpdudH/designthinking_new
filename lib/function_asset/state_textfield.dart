import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Cupertino_Textfield extends StatefulWidget {
  String name;
  Cupertino_Textfield({this.name});
  @override
  _Cupertino_TextfieldState createState() => _Cupertino_TextfieldState();
}

class _Cupertino_TextfieldState extends State<Cupertino_Textfield> {
  String name;
  //실제 textfield인 기능

  @override
  void initState() {
    super.initState();
    name = widget.name;
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 5.0,
        minWidth: 10.0,
        maxWidth: 200.0,
        maxHeight: 10.0,
      ),
      child: CupertinoTextField(
        placeholder: "2 packs",
        onChanged: (counts) {
          setState(() {
            firestore.collection("User").doc(name).update({"count": counts});
          });
        },
      ),
    );
  }
}
