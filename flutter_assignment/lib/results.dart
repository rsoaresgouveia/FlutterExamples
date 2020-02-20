import 'package:flutter/material.dart';

import './changer.dart';

class Results extends StatelessWidget {
  final List text;
  final int textIndex;
  final Function changeText;

  Results({ @required this.text, @required this.textIndex, @required this.changeText});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              text[textIndex],
              style: TextStyle(fontSize: 40),
              textAlign: TextAlign.center,
            ),
          ),
          Changer(changeText)
        ],
      ),
    );
  }
}
