import 'package:expense_t/models/transaction.dart';
import 'package:expense_t/widgets/chart.dart';
import 'package:expense_t/widgets/new_transaction.dart';
import 'package:expense_t/widgets/transaction_list.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Quicksand',
        errorColor: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   List<Transaction> _userTranactions = [
    Transaction(id: 't1', title: 'shoes', amount: 22.58, date: DateTime.now()),
    Transaction(id: 't2', title: 'shorts', amount: 30.58, date: DateTime.now()),
  ];

  void _addNewtx(String title, double amount, DateTime chosenDate) {
    print('come on');

    final newTx = Transaction(
      title: title,
      amount: amount,
      id: DateTime.now().toString(),
      date: chosenDate,
    );
    setState(() {
      _userTranactions.add(newTx);
    });
  }

  void deleteTransaction(String id) {
    setState(() {
      _userTranactions.removeWhere((tx) => tx.id == id);
    });
  }

  void _startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bctx) {
          return NewTransaction(_addNewtx);
        });
  }

  List<Transaction> get _recentTransactions {
    return _userTranactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        title: Text('Expense Tracker'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _startNewTransaction(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Chart(_recentTransactions),
            TransactionList(_userTranactions, deleteTransaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          _startNewTransaction(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
