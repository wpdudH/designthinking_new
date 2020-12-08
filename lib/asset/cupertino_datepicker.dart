import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../function_asset/build_buttonset.dart';
import '../function_asset/date_picker.dart';
import '../function_asset/toggle_date_picker_button.dart';
import '../function_asset/util.dart';

class Cuper extends StatelessWidget {
  Cuper({Key key}) : super(key: key);

  Future<void> showPicker(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            children: <Widget>[
              Container(
                height: 200,
                width: 500,
                child: Column(
                  children: [
                    Expanded(
                      child: HandlePikcerButton(),
                    ),
                    Expanded(
                      flex: 7,
                      child: CuDatePicker(),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ToggleDatePicker(
                showPicker: showPicker,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
