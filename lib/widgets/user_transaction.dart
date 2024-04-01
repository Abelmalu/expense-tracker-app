import 'package:expense_t/widgets/new_transaction.dart';
import 'package:expense_t/widgets/transaction_lsit.dart';
import 'package:flutter/cupertino.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({super.key});

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addTransaction),
        TransactionList(_userTranaction),
      ],
    );
  }
}
