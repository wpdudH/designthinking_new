import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './function_asset/toggle_textfield.dart';
import 'asset/cupertino_datepicker.dart';
import 'asset/cupertino_textfield.dart';
import './function_asset/toggle_date_picker_button.dart';
import './function_asset/build_buttonset.dart';
import './function_asset/date_picker.dart';
import './function_asset/state_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> showPicker(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                height: 300,
                width: 500,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: HandlePikcerButton(),
                    ),
                    Expanded(
                      flex: 7,
                      child: CuDatePicker(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      });
}

Future<void> showPicker2(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 500,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: HandlePikcerButton(),
            ),
            Expanded(
              flex: 7,
              child: Cupertino_Textfield(),
            )
          ],
        ),
      );
    },
  );
}

class Curegister extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            SizedBox(
              width: 345.0,
              height: 792.0,
              child: Stack(children: <Widget>[
                Container(),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(154.0, 69.0, 80.0, 20.0),
                  size: Size(344.6, 792.0),
                  pinTop: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontFamily: 'Acumin Pro SemiCondensed',
                      fontSize: 20,
                      color: const Color(0xff748a9d),
                      letterSpacing: -0.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(280.0, 60.0, 80.0, 20.0),
                  size: Size(344.6, 792.0),
                  fixedHeight: true,
                  fixedWidth: true,
                  child: IconButton(
                    icon: Icon(Icons.check),
                    color: Colors.grey[300],
                    alignment: Alignment.center,
                    onPressed: () {
                      print('REGISTER');
                    },
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(10.0, 60.0, 80.0, 20.0),
                  size: Size(344.6, 792.0),
                  fixedHeight: true,
                  fixedWidth: true,
                  child: IconButton(
                    icon: Icon(Icons.backspace),
                    color: Colors.grey[300],
                    alignment: Alignment.center,
                    onPressed: () {
                      print('Go back');
                    },
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(86.0, 157.0, 204.0, 249.0),
                  size: Size(344.6, 792.0),
                  fixedWidth: true,
                  fixedHeight: true,
                  child: Stack(
                    children: <Widget>[
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(0.0, 0.0, 204.0, 249.0),
                        size: Size(204.0, 249.0),
                        pinLeft: true,
                        pinRight: true,
                        pinTop: true,
                        pinBottom: true,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: const Color(0xffffffff),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0x12000000),
                                offset: Offset(0, 5),
                                blurRadius: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(10.0, 450.0, 300.0, 10.0),
                  size: Size(315.0, 730.0),
                  pinLeft: true,
                  pinRight: true,
                  pinTop: true,
                  pinBottom: true,
                  child: ToggleDatePicker(
                    showPicker: showPicker,
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(10.0, 600.0, 300.0, 10.0),
                  size: Size(315.0, 730.0),
                  pinLeft: true,
                  pinRight: true,
                  pinTop: true,
                  pinBottom: true,
                  child: ToggleTextField(
                    showPicker: showPicker2,
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
