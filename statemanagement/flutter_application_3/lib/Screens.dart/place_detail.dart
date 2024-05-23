import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Placedetail extends StatelessWidget {
  final String title;
  const Placedetail(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location detail'),
      ),
      body: Center(child: Text(title)),
    );
  }
}
