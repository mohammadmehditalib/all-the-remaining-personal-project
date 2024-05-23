

import 'package:fdemo/providers/taskoperations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
    
      providers: [
       ChangeNotifierProvider(create: (_)=>taskOpeartions() )

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const FirstPage(),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    //int count = 0;
    final taskdata = Provider.of<taskOpeartions>(context);
    TextEditingController f1 = TextEditingController();
    TextEditingController f2 = TextEditingController();

    final tasklist = taskdata.data;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add and remove task'),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(hintText: 'TASK NAME '),
                            controller: f1,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(hintText: 'DESCRIPTION'),
                            controller: f2,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                taskdata.addTask(f1.text.toString(), f2.text.toString());
                              },
                              child: Text(' add task'))
                        ],
                      );
                    });
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (ctx, index) {

              return Dismissible(
                key: ValueKey(index),
                onDismissed: (direction) => {
                tasklist.remove(index)
                },
                child: Card(
                  child: Column(
                    children: [Text(tasklist[index].task), Text(tasklist[index].description)],
                  ),
                ),
              );
            },
            itemCount: tasklist.length,
          )
        ],
      ),
    );
  }
}
