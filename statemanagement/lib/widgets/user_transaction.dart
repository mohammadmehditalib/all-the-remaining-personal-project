import 'package:flutter/material.dart';
import 'package:statemanagement/widgets/new_transaction.dart';
import 'package:statemanagement/widgets/transaction_list.dart';

import '../Models/transaction.dart';

class Usertransaction extends StatefulWidget {
  const Usertransaction({super.key});
  

  @override
  State<Usertransaction> createState() => _UsertransactionState();
}

class _UsertransactionState extends State<Usertransaction> {
  List<Transaction> transaction = [
    Transaction(id: 'tx1', title: 'mehdi', amount: 98.0, date: DateTime.now()),
    Transaction(id: "tx2", title: "talib", amount: 99.0, date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
         //NewTransaction(addNewTransaction),
        TransactionList(transaction)
      ],
    );
  }
}
  
