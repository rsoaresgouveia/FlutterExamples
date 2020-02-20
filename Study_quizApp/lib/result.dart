import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  
  int totalScore;
  final Function resetQuiz;

  Result(this.totalScore, this.resetQuiz);

  String get resultPhrase {
    String resultext;

    if (totalScore <= 0) {
      resultext = '<Frase inspiracional 1>';
    } else if (totalScore <= 10) {
      resultext = '<Parabéns?>';
    } else if (totalScore <= 20) {
      resultext = 'Só estou seguindo o tutorial';
    } else if (totalScore <= 40) {
      resultext = 'Yeeeeeeeey!';
    } else {
      resultext = 'Palmas!';
    }
    return resultext;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Recomeçar o quiz'),
            onPressed: resetQuiz,
          )
        ],
      ),
    );
  }
}
