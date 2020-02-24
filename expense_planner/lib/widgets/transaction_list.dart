import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _dummyTransactionList;
  bool listOrother = true;
  final Function deleteElement;

  TransactionList(this._dummyTransactionList, this.deleteElement);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: _dummyTransactionList.isEmpty
          ? Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Text('No Transaction has been add yet!'),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                      height: 300,
                      padding: EdgeInsets.all(20),
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.fill,
                      )),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return listOrother == true
                    ? Card(
                        elevation: 5,
                        margin: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 5,
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            child: Padding(
                              padding: EdgeInsets.all(6),
                              child: FittedBox(
                                child: Text(
                                    '\$${_dummyTransactionList[index].amount}'),
                              ),
                            ),
                          ),
                          title: Text(
                            _dummyTransactionList[index].title,
                            style: Theme.of(context).textTheme.title,
                          ),
                          subtitle: Text(
                            DateFormat.yMMMd()
                                .format(_dummyTransactionList[index].date),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            color: Colors.red,
                            onPressed: () {
                              deleteElement(_dummyTransactionList[index].id);
                            },
                          ),
                        ),
                      )
                    : Card(
                        // Se listOrother for flaso, eu posso trocar a visualização do meu app
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
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Text(
                                  '\$ ${_dummyTransactionList[index].amount.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  _dummyTransactionList[index].title,
                                  style: Theme.of(context).textTheme.title,
                                ),
                                Text(
                                  DateFormat('dd - MMMM - yyyy').format(
                                      _dummyTransactionList[index].date),
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
