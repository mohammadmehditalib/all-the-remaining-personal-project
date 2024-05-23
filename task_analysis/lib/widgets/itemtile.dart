import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:task_analysis/Models/task.dart';
// import 'package:task_analysis/controller/controller.dart';

class Itemtile extends StatefulWidget {
  final int serialNo;
  final String description;
  final bool isCompleted;

  const Itemtile({
    super.key,
    required this.serialNo,
    required this.description,
    required this.isCompleted,
  });

  @override
  State<Itemtile> createState() => _ItemtileState();
}

class _ItemtileState extends State<Itemtile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(widget.serialNo.toString()),
        Text(widget.description),
        Checkbox(
            value: widget.isCompleted,
            onChanged: (_) {
              setState(() {
                
              });
            })
      ],
    );
  }
}
