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

  void whenSumbitted(){

      if (titlecontroller.text.isEmpty ||
        double.parse(amountcontroller.text) <= 0) {
      return;
    }
    widget.addNewTx(titlecontroller.text, double.parse(amountcontroller.text));
    Navigator.of(context).pop();


  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: InputDecoration(labelText: 'title'),
            controller: titlecontroller,
           onSubmitted: (_) => whenSumbitted(),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'amount'),
            controller: amountcontroller,
            keyboardType: TextInputType.number,
            onSubmitted: (_) =>whenSumbitted(),
          ),
          TextButton(
              onPressed: whenSumbitted,
              child: Text('add tranaction')),
        ]),
      ),
    );
  }
}
