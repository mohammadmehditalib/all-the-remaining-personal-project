
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:statemanagement/widgets/user_transaction.dart';

class NewTransaction extends StatefulWidget {
  final Function addtx;
  NewTransaction(this.addtx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
   TextEditingController amountController = TextEditingController();
    TextEditingController titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 7),
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
            labelText: 'Amount', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
            controller: amountController,
            
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 7),
          child: TextField(
            decoration: const InputDecoration(
                labelText: 'Title', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
            controller: titleController,
          ),
        ),
        ElevatedButton(
            onPressed: () {
              widget.addtx(titleController.text, double.parse(amountController.text));

            },
            child: const Text('Add Transaction')),
      ],
    );
  }
}