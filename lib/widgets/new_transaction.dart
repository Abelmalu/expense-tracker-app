import 'package:flutter/material.dart';
import './user_transaction.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              // onChanged: (value) {

              // },
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'amount'),
              // onChanged: (value) {
              //   amountInput = value;
              // },
              controller: amountController,
            ),
            TextButton(
              onPressed: () {
                addTx(titleController.text, double.parse(amountController.text));
              },
              child: Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
