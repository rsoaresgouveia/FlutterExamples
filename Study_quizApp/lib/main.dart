import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionsIndex = 0;
  int _totalScore = 0;
  final _questions = const [
    {
      'questionText': 'Qual \é o seu animal favorito?',
      'resposta': [
        {'text': 'cachorro', 'score': 10},
        {'text': 'gato', 'score': 7},
        {'text': 'cobra', 'score': 5},
        {'text': 'tubarão', 'score': 11}
      ]
    },
    {
      'questionText': 'Qual \é a sua cor favorita?',
      'resposta': [
        {'text': 'azul', 'score': 10},
        {'text': 'preto', 'score': 4},
        {'text': 'laranja', 'score': 2},
        {'text': 'vermelho', 'score': 0}
      ]
    },
    {
      'questionText': 'Qual \é a sua comida favorita?',
      'resposta': [
        {'text': 'cachorro-quente', 'score': 7},
        {'text': 'arroz', 'score': 9},
        {'text': 'feijão', 'score': 6},
        {'text': 'caviar', 'score': -13}
      ]
    },
    {
      'questionText': 'Qual \é o seu planeta favorito?',
      'resposta': [
        {'text': 'terra', 'score': 8},
        {'text': 'marte', 'score': 9},
        {'text': 'venus', 'score': 7},
        {'text': 'jupiter', 'score': 15}
      ]
    },
  ];

  void _resetQuiz(){
    setState(() {
      _questionsIndex = 0;
      _totalScore = 0;
    });
  }

  void _respostas(int score) {
    setState(() {
      if (_questionsIndex < _questions.length) {
        _questionsIndex++;
      }
    });

    this._totalScore += score;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text('My First App'),
              backgroundColor: Colors.purple,
            ),
            body: _questionsIndex < _questions.length
                ? Quiz(
                    questionIndex: this._questionsIndex,
                    respostaFunction: _respostas,
                    questions: _questions,
                  )
                : Result(this._totalScore, this._resetQuiz)));
  }
}
