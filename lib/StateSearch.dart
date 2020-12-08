import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StateSearch extends StatefulWidget {
  //실제 Searchbar인 부분
  @override
  _StateSearchState createState() => _StateSearchState();
}

class _StateSearchState extends State<StateSearch> {
  final TextEditingController _textController = new TextEditingController();
  var keyword;
  var onchangedvalue;
  var onsubmittedvalue;

  void onChangedValue(var value) {
    setState(() {
      onchangedvalue = keyword;
    });
  }

  void onSubmittedValue(var value) {
    setState(() {
      onsubmittedvalue = keyword;
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
      child: Row(
        children: <Widget>[
          CupertinoTextField(
            controller: _textController,
            placeholder: "search",
            onChanged: (onchangedvalue) {
              print(onchangedvalue);
            },
            onSubmitted: _handleSubmitted,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text)),
          ),
        ],
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
  }
}