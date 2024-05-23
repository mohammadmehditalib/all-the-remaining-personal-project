import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../Models/transaction.dart';

class TransactionList extends StatefulWidget {
  List<Transaction> transaction;
  TransactionList(this.transaction);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemBuilder: (ct, index) {
          return Card(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.pink),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: Text(
                          widget.transaction[index].amount.toString().substring(0,2),
                          style: const TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.transaction[index].title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.transaction[index].date.toString(),
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
        itemCount: widget.transaction.length,
      ),
    );
  }
}
