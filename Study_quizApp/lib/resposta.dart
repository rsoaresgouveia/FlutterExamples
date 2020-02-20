import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final Function selectHandler;
  final String respostaText;

  Resposta(this.selectHandler, this.respostaText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue[700],
        textColor: Colors.white,
        child: Text(respostaText),
        onPressed: selectHandler,
      ),
    );
  }
}
