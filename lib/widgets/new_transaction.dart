import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTx;
  NewTransaction(this.addNewTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titlecontroller = TextEditingController();

  final amountcontroller = TextEditingController();
  var selectedDate = null;

  void whenSumbitted() {
    if (titlecontroller.text.isEmpty ||
        double.parse(amountcontroller.text) <= 0 ||
        selectedDate == null) {
      return;
    }
    widget.addNewTx(titlecontroller.text, double.parse(amountcontroller.text),
        selectedDate);
    Navigator.of(context).pop();
  }

  void presentDatePicker() {
    showDatePicker(
            context: context,
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
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
            onSubmitted: (_) => whenSumbitted(),
          ),
           Row(
              children: [
               
                
                Text(selectedDate == null
                    ? 'no date chosen'
                    : DateFormat.yMd().format(selectedDate)),

                     TextButton(
                child: Text('choose date'),
                onPressed: () {
                  presentDatePicker();
                },
              ),
              ],
            ),
         
          TextButton(onPressed: whenSumbitted, child: Text('add tranaction')),
        ]),
      ),
    );
  }
}
