import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:designthinking_new/data_move.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './Crawling.dart';
import 'curegister.dart';

class SearchScreen extends StatefulWidget {
  static String tag = 'SearchScreen-page';
  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  FirebaseFirestore firestore =
      FirebaseFirestore.instance; //Firebase -> FirebaseFirestore

  final TextEditingController _filter = TextEditingController();
  FocusNode focusNode = FocusNode();
  String _searchText;
  String name;

  SearchScreenState() {
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(5, 50, 5, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back, size: 30),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  "Search",
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xff748A9D),
                  ),
                ),
                Opacity(
                  opacity: 0.0,
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.check,
                            color: Color(0xff748A9D), size: 30),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: TextField(
                    focusNode: focusNode,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    autofocus: true,
                    controller: _filter,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white38,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(0xff99B5DF),
                        size: 20,
                      ),
                      suffixIcon: focusNode.hasFocus
                          ? IconButton(
                              icon: Icon(
                                Icons.cancel,
                                color: Color(0xff99B5DF),
                                size: 20,
                              ),
                              onPressed: () {
                                setState(() {
                                  _filter.clear();
                                  _searchText = "";
                                });
                              },
                            )
                          : Container(),
                      hintText: 'What are you searching for?',
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ),
                focusNode.hasFocus
                    ? Expanded(
                        child: IconButton(
                          icon: Icon(Icons.check,
                              color: Color(0xff748A9D), size: 30),
                          onPressed: () {
                            setState(() {
                              name = _searchText;
                              focusNode.unfocus();
                            });
                          },
                        ),
                      )
                    : Expanded(
                        flex: 0,
                        child: Container(),
                      )
              ],
            ),
          ),
          Container(
              child: name != null
                  ? Container(
                      padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
                      child: Stack(
                        children: <Widget>[
                          InkWell(
                              child: Image.network(
                                  'http://ch4n3.kr:3000/image?keyword=' + name),
                              onTap: () {
                                String ingredient = name;
                                String image_network =
                                    'http://ch4n3.kr:3000/image?keyword=' +
                                        name;
                                dataControl(ingredient, 'a');
                                firestore
                                    .collection('User')
                                    .doc(ingredient)
                                    .set({
                                  'name': name,
                                  'count': "",
                                  'expiration_date': "",
                                  'image_network':
                                      'http://ch4n3.kr:3000/image?keyword=' +
                                          name,
                                });

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Curegister(name, image_network)),
                                );
                              }),
                        ],
                      ),
                    )
                  : Container()),
        ],
      ),
    );
  }
}
