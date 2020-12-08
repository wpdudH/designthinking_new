import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cupertino_Textfield extends StatefulWidget {
  @override
  _Cupertino_TextfieldState createState() => _Cupertino_TextfieldState();
}

class _Cupertino_TextfieldState extends State<Cupertino_Textfield> {
  //실제 textfield인 기능
  var count;
  var onchangedvalue;
  var onsubmittedvalue;

  void onChangedValue(var value) {
    setState(() {
      onchangedvalue = count;
    });
  }

  void onSubmittedValue(var value) {
    setState(() {
      onsubmittedvalue = count;
    });
  }

  @override
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
        onChanged: onchangedvalue,
        onSubmitted: onsubmittedvalue,
      ),
    );
  }
}
