import 'package:expense_t/widgets/new_transaction.dart';
import 'package:expense_t/widgets/user_transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './transaction_lsit.dart';

void main() {
  runApp(MyHomepage());
}

class MyHomepage extends StatelessWidget {
  // String? titleInput;
  // String? amountInput;
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('YENEW GUD')),
            body: Column(children: [
              Container(
                width: double.infinity,
                child: Card(
                  elevation: 6,
                  child: Text('CHARTS'),
                ),
              ),
              UserTransaction(),
            ])));
  }
}

// how can i learn this things to make them play