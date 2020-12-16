import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'data_move.dart';

class DocumentView1 extends StatefulWidget {
  @override
  DocumentView1State createState() => DocumentView1State();
}

class DocumentView1State extends State<DocumentView1> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot> currentStream;

  void initState() {
    super.initState();
    firestore.collection("User").get().then((QuerySnapshot querySnapshot) => {
          querySnapshot.docs.forEach((doc) {
            print(doc["image_network"]);
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Container(),
    ]));
  }

  //document를 ingredient로 묶음
  //document -> name[0], name[1] 을 위한 List 필요함.-> doc(name[i]).field 읽도록 함.
}
