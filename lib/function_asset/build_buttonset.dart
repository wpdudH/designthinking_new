import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HandlePikcerButton extends StatelessWidget {
  //cancel, done 버튼
  const HandlePikcerButton({
    Key key,
    this.onPressCancel,
    this.onPressDone,
  }) : super(key: key);

  final Function onPressCancel;
  final Function onPressDone;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CupertinoButton(
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          onPressed: onPressCancel ??
              () {
                Navigator.pop(context);
              },
        ),
        CupertinoButton(
          child: Text(
            'Done',
          ),
          onPressed: onPressCancel ??
              () {
                Navigator.pop(context);
              },
        ),
      ],
    );
  }
}
