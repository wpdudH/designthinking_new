import 'package:designthinking_new/curegister.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'ReviseHome.dart';
import 'data_move.dart';
import 'SearchScreen.dart';

class DocumentView1 extends StatefulWidget {
  static String tag = 'mmain-page';
  @override
  DocumentView1State createState() => DocumentView1State();
}

class DocumentView1State extends State<DocumentView1> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot> currentStream;
  List<String> nameList = [];

  void initState() {
    super.initState();
    firestore.collection("User").get().then((QuerySnapshot querySnapshot) => {
          querySnapshot.docs.forEach((doc) {
            nameList.add(doc["name"]);
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(children: <Widget>[
        // Adobe XD layer: 'fixed' (group)

        // Adobe XD layer: '27088-[Converted]' (shape)
        Container(
          child: Center(
            child: Container(
              width: 500.0,
              height: 460.0,
              margin: EdgeInsets.fromLTRB(25.0, 115.0, 0.0, 0.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Refrigerator.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
        ),

        Container(
            child: nameList != null
                ? Container(
                    padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          imageList(nameList),
                        ]),
                  )
                : Container()),

        Transform.translate(
          offset: Offset(150.6, 100.0),
          child: FlatButton(
              color: const Color(0xff404E5A),
              child: Text(
                'Register',
                style: TextStyle(
                  fontFamily: 'Acumin Pro SemiCondensed',
                  fontSize: 16,
                  color: const Color(0xffffffff),
                  letterSpacing: -0.16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchScreen()),
                );
              }),
        ),
        Container(),
        Container(),
        Container(),
      ]),
    );
  }
  //document를 ingredient로 묶음
  //document -> name[0], name[1] 을 위한 List 필요함.-> doc(name[i]).field 읽도록 함.

  Widget imageList(List<String> nameList) {
    int lstLength = nameList.length;
    if (lstLength <= 5) {
      return Container(
        height: 200,
        padding: EdgeInsets.symmetric(vertical: 15),
        child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 100),
            scrollDirection: Axis.horizontal,
            children: makeImageBar(context, lstLength, nameList)),
      );
    }
    return Text("hello");
  }

  List<Widget> makeImageBar(
      BuildContext context, int lstLength, List<String> nameList) {
    List<Widget> results = [];
    for (int i = 0; i < lstLength; i++) {
      results.add(InkWell(
        child: Image.network(
            'http://ch4n3.kr:3000/image?keyword=' + nameList[i],
            width: 40,
            height: 40,
            fit: BoxFit.contain),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ReviseHome(nameList[i])));
        },
      ));
    }
    return results;
  }
}
