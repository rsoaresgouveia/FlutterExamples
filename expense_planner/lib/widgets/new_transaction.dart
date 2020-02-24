import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    if(_tAmount.text.isEmpty){
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
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              // style: _tTitleCheck == true
              //     ? TextStyle(color: Colors.red)
              //     : TextStyle(color: Colors.green),

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
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  onPressed: _presentDatePicker,
                  child: Text(
                    'Choose Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            FlatButton(
              child: Text('Send'),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
              onPressed: _submitData,
            )
          ],
        ),
      ),
    );
  }
}
