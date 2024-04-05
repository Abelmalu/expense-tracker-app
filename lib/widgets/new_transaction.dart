import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTx;
  NewTransaction(this.addNewTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titlecontroller = TextEditingController();

  final amountcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: InputDecoration(labelText: 'title'),
            controller: titlecontroller,
            onSubmitted: (value) {
              widget.addNewTx(
                  titlecontroller.text, double.parse(amountcontroller.text));
              Navigator.of(context).pop();
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'amount'),
            controller: amountcontroller,
            keyboardType: TextInputType.number,
            onSubmitted: (value) {
              if (titlecontroller.text.isEmpty ||
                  double.parse(amountcontroller.text) <= 0) {
                return;
              }
              widget.addNewTx(
                  titlecontroller.text, double.parse(amountcontroller.text));
                  Navigator.of(context).pop();
            },
          ),
          TextButton(
              onPressed: () {
                if (titlecontroller.text.isEmpty ||
                    double.parse(amountcontroller.text) <= 0) {
                  return;
                }
                widget.addNewTx(
                    titlecontroller.text, double.parse(amountcontroller.text));
                    Navigator.of(context).pop();
              },
              child: Text('add tranaction')),
        ]),
      ),
    );
  }
}
