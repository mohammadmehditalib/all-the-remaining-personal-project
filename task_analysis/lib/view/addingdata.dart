import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_analysis/Models/task.dart';
// import 'package:task_analysis/controller/controller.dart';
import 'package:task_analysis/cubit/cubit/task_cubit.dart';

class Adddata extends StatefulWidget {
  const Adddata({super.key});

  @override
  State<Adddata> createState() => _AdddataState();
}

class _AdddataState extends State<Adddata> {
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        TextFormField(
          controller: description,
        ),
        BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state) {
            return ElevatedButton(
                onPressed: () {
                  context.read<TaskCubit>().addTask(Task(
                      serialNo: state.holder.length,
                      description: description.text,
                      isCompleted: false));
                 Navigator.pop(context);     
                },
                child: const Text('Add the task'));
          },
        )
      ],
    ));
  }
}
