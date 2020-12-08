import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CuDatePicker extends StatefulWidget {
  String name;
  CuDatePicker({this.name});

  @override
  _CuDatePickerState createState() => _CuDatePickerState();
}

class _CuDatePickerState extends State<CuDatePicker> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 300.0,
      ),
      child: CupertinoDatePicker(
        initialDateTime: DateTime.now(),
        minimumYear: 2018,
        maximumYear: 2030,
        mode: CupertinoDatePickerMode.date,
        onDateTimeChanged: (DateTime newdate) {
          setState(() {
            DateTime pickDate = newdate;
            String expiration_date = pickDate as String;

            firestore
                .collection("")
                .doc("")
                .update({"expiration_date": expiration_date});
          });
        },
      ),
    );
  }
}
