import 'package:flutter/material.dart';
import 'package:statemanagement/Models/transaction.dart';
import 'package:statemanagement/widgets/chart.dart';
import 'package:statemanagement/widgets/new_transaction.dart';
import 'package:statemanagement/widgets/transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'stateManagement',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> transaction = [
    //Transaction(id: 'tx1', title: 'mehdi', amount: 98.0, date: DateTime.now()),
    //Transaction(id: "tx2", title: "talib", amount: 99.0, date: DateTime.now()),
  ];

  List<Transaction>get _recentTransaction{

    return transaction.where((element) {
      return element.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Progress Application"),
          actions: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (_) {
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          child: NewTransaction(addNewTransaction),
                        );
                      });
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Chart(_recentTransaction),
              TransactionList(transaction)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ));
  }


  addNewTransaction(String title, double amount) {
    if (title.isEmpty || amount == 0) {
      return;
    }
    Transaction obj = Transaction(id: 'tx3', title: title, amount: amount, date: DateTime.now());
    transaction.add(obj);
    setState(() {
      Navigator.of(context).pop();
    });
  }
}
