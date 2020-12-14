import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class CuDatePicker extends StatefulWidget {
  String name;
  CuDatePicker({this.name});

  @override
  _CuDatePickerState createState() => _CuDatePickerState();
}

class _CuDatePickerState extends State<CuDatePicker> {
  String name;

  @override
  void initState() {
    super.initState();
    name = widget.name;
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;

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
            String expiration_date = DateFormat('yyyy-MM-dd').format(newdate);

            firestore
                .collection("User")
                .doc(name)
                .update({"expiration_date": expiration_date});
          });
        },
      ),
    );
  }
}
