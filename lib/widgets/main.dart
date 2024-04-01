import 'package:expense_t/models/transaction.dart';
import 'package:expense_t/widgets/new_transaction.dart';
import 'package:expense_t/widgets/transaction_lsit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(home: MyHomepage()));
}

class MyHomepage extends StatefulWidget {
  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  final List<Transaction> _userTranaction = [
    Transaction(
        id: 't1', amount: 22.3, title: 'new shoes', date: DateTime.now()),
    Transaction(
        id: 't2',
        amount: 44.3,
        title: 'weekly groceries',
        date: DateTime.now()),
  ];

  void _addTransaction(String txTitle, double txAmoutn) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmoutn,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTranaction.add(newTx);
    });
  }

  // String? titleInput;
  void _startAddNewtransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return NewTransaction(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expense Tracker'),
          actions: [
            IconButton(
              onPressed: () {
                _startAddNewtransaction(context);
              },
              icon: Icon(Icons.add),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              width: double.infinity,
              child: Card(
                elevation: 6,
                child: Text('CHARTS'),
              ),
            ),
            TransactionList(_userTranaction),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _startAddNewtransaction(context);
          },
          child: Icon(Icons.add),
         
        ),
      ),
    );
  }
}

// how can i learn this things to make them play