// 1) Create a new Flutter App (in this project) and output an AppBar and some text
// below it
// 2) Add a button which changes the text (to any other text of your choice)
// 3) Split the app into three widgets: App, TextControl & Text

import 'package:flutter/material.dart';

import './results.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _text = ['First Text to show', 'Second Text to show!'];
  var _textIndex = 0;

  void _changeText() {
    setState(() {
      if (_textIndex == 1) {
        _textIndex--;
      } else {
        _textIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: Text('Flutter Assignment Project'),
        ),
        body: Results(
          changeText: _changeText,
          text: _text,
          textIndex: _textIndex,
        ),
      ),
    );
  }
}
