import 'package:expense_t/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No Transactions to show",
                ),
                Container(
                    height: 200,
                    child: Image.asset('assets/images/download.png',
                        fit: BoxFit.cover)),
              ],
            )
          : ListView(
              children: [
                ...transactions.map((tx) {
                  return Card(
                    child: Row(
                      children: [
                        Container(
                            margin: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2,
                              ),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Text('\$${tx.amount.toStringAsFixed(2)}',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor))),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tx.title.toString(),
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                            Text(DateFormat.yMMMd().format(tx.date)),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            deleteTx(tx.id);
                          },
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                        )
                      ],
                    ),
                  );
                }).toList()
              ],
            ),
    );
  }
}
