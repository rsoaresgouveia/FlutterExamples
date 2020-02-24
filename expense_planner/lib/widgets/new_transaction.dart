import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './adaptive_button.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController _tTitle = TextEditingController();
  final TextEditingController _tAmount = TextEditingController();
  DateTime _selectedDate;
  // bool _tTitleCheck;

  void _submitData() {
    if (_tAmount.text.isEmpty) {
      return;
    }

    final enteredTitle = _tTitle.text;
    final enteredAmount = double.parse(_tAmount.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      // if (enteredTitle == null) {
      //   setState(() {
      //     _tTitleCheck = true;
      // });
      return;
      // }
    }

    widget.addNewTransaction(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    const _minimunYearToPick = 10;

    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - _minimunYearToPick),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final _androidView = Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        TextField(
          decoration: InputDecoration(labelText: 'Title'),
          //onChanged: (val) => textTitle = val
          controller: _tTitle,
          onSubmitted: (_) => _submitData(),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'Amount',
            fillColor: Colors.purple,
          ),
          //onChanged: (val) => textAmount = val,
          controller: _tAmount,
          keyboardType: TextInputType.number,
          onSubmitted: (_) => _submitData(),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                _selectedDate == null
                    ? ('No date Chosen')
                    : DateFormat('dd - MMMM - yyyy').format(_selectedDate),
              ),
            ),
           AdaptiveButton('Choose Date', _presentDatePicker),
          ],
        ),
        FlatButton(
          child: Text('Send'),
          color: Theme.of(context).primaryColor,
          textColor: Theme.of(context).textTheme.button.color,
          onPressed: _submitData,
        )
      ],
    );

    final _iosView = Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: CupertinoTextField(
            placeholder: 'Title',
            decoration: BoxDecoration(),
            controller: _tTitle,
            onSubmitted: (_) => _submitData(),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: CupertinoTextField(
            placeholder: 'Amount',
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            controller: _tAmount,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => _submitData(),
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                _selectedDate == null
                    ? ('No date Chosen')
                    : DateFormat('dd - MMMM - yyyy').format(_selectedDate),
              ),
            ),
            AdaptiveButton('Choose Date', _presentDatePicker),
          ],
        ),
        CupertinoButton(
          child: Text(
            'Send',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.button.color,
            ),
          ),
          color: Theme.of(context).primaryColor,
          onPressed: _submitData,
        )
      ],
    );

    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Platform.isIOS ? _iosView : _androidView,
        ),
      ),
    );
  }
}
