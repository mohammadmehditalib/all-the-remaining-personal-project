import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:task_analysis/controller/controller.dart';
import 'package:task_analysis/cubit/cubit/task_cubit.dart';
import 'package:task_analysis/view/addingdata.dart';
import 'package:task_analysis/widgets/itemtile.dart';
////  View portion of mvc architecture

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
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
      body: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          return ListView.builder(
              itemCount: state.holder.length,
              itemBuilder: (context1, index) {
                return ListTile(
                  title: Text(state.holder[index].description),
                  leading: Text(state.holder[index].serialNo.toString()),
                  trailing: Checkbox(
                      value: state.holder[index].isCompleted,
                      onChanged: (_) {
                        setState(() {
                          context.read<TaskCubit>().isCompletedToggle(state.holder[index]);
                        });
                      }),
                );
              });
        },
      ),
    );
  }
}
