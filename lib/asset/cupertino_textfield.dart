import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../function_asset/toggle_textfield.dart';
import '../function_asset/build_buttonset.dart';
import '../function_asset/state_textfield.dart';
import '../function_asset/toggle_date_picker_button.dart';
import '../function_asset/util.dart';

class Tino extends StatelessWidget {
  Tino({Key key}) : super(key: key);

  Future<void> showPicker(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 100,
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ToggleTextField(
                showPicker: showPicker,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
