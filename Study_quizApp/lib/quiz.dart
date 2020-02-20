import 'package:flutter/material.dart';

import './question.dart';
import './resposta.dart';

class Quiz extends StatelessWidget {
  final Function respostaFunction;
  final List<Map<String, Object>> questions;
  final questionIndex;

  Quiz(
      {@required this.respostaFunction,
      @required this.questions,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(questions[questionIndex]['questionText']),
        ...(questions[questionIndex]['resposta']
                as List<Map<String, Object>>)
            .map((resposta) {
          //isso é complicado
          return Resposta(
              () => respostaFunction(resposta['score']), resposta['text'].toString().toUpperCase());
        }).toList()
      ],
    );
  }
}
