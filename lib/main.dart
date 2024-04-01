//YENEW GUD

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyHomepage());
}

class MyHomepage extends StatelessWidget {
  List<Transaction> transactions = [
    Transaction(
        id: 't1', amount: 22.3, title: 'new shoes', date: DateTime.now()),
    Transaction(
        id: 't2',
        amount: 44.3,
        title: 'weekly groceries',
        date: DateTime.now()),
  ];
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
              Column(
                children: transactions.map((tx) {
                  return Card(
                      child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '\$${tx.amount}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tx.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            DateFormat.yMMMd().format(tx.date),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )
                    ],
                  ));
                }).toList(),
              ),
            ])));
  }
}

// how can i learn this things to make them play