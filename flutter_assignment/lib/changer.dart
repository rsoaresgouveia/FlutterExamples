import 'package:flutter/material.dart';

class Changer extends StatelessWidget {
  
  final Function _changeText;

  Changer(this._changeText);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('Change Text!'),
      onPressed: _changeText,
    );
  }
}
