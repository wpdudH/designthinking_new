import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleTextField extends StatelessWidget {
  const ToggleTextField({
    Key key,
    @required this.showPicker,
  }) : super(key: key);

  final Function(BuildContext context) showPicker;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.blue[100],
      child: Text('Number'),
      onPressed: () {
        showPicker(context);
      },
    );
  }
}
