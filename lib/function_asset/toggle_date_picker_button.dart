import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleDatePicker extends StatelessWidget {
  const ToggleDatePicker({
    Key key,
    @required this.showPicker,
  }) : super(key: key);

  final Function(BuildContext context) showPicker;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      borderRadius: BorderRadius.circular(20.0),
      color: Color(0xff99B5DF),
      child: Text('Expiration Date'),
      onPressed: () {
        showPicker(context);
      },
    );
  }
}
