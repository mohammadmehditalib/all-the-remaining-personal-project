import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:task_analysis/view/addingdata.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController Password = TextEditingController();
  TextEditingController Email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const Adddata()))
                  .then((value) {
                setState(() {});
              });
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormField(
            initialValue: 'Email',
            controller: Email,
          ),
          TextFormField(
            initialValue: 'Password',
            controller: Password,
          ),
          ElevatedButton(onPressed: () => {}, child: const Text('sign up')),
          ElevatedButton(onPressed: () => {}, child: const Text('login'))
        ],
      ),
    );
  }
}
