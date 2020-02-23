import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _dummyTransactionList;

  TransactionList(this._dummyTransactionList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  )),
                  margin: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  padding: EdgeInsets.all(5),
                  child: Text(
                    '\$ ${_dummyTransactionList[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _dummyTransactionList[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      DateFormat('dd - MMMM - yyyy')
                          .format(_dummyTransactionList[index].date),
                      style: TextStyle(
                        color: Colors.blueGrey[500],
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        itemCount: _dummyTransactionList.length,
      ),
    );
  }
}
