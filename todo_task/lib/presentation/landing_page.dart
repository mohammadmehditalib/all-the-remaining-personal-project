import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/cubits/cubit/todoactivecount_cubit.dart';
import 'package:todo_task/cubits/cubit/todoactivecount_state.dart';
import 'package:todo_task/cubits/cubit/todolist_cubit.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO APPLICATION'),
      ),
      body: Column(
        children: [
          BlocBuilder<TodoactivecountCubit, TodoactivecountState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Task details'),
                  Text('${state.activeCount.toString()} items left')
                ],
              );
            },
          ),
          const SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: const Text('All'),
                onTap: () => {},
              ),
              InkWell(
                child: const Text('Active'),
                onTap: () {},
              ),
              InkWell(
                child: const Text('Completed'),
                onTap: () {},
              ),
            ],
          ),
          BlocBuilder<TodolistCubit, TodolistState>(
            builder: (context, state) {
              return ListView.builder(
                  itemCount: state.holder.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => CheckboxListTile(
                      value: state.holder[index].active,
                      title: Text(state.holder[index].description),
                      onChanged: (_) {
                        setState(() {
                          context.read<TodolistCubit>().toggleAcivityStatus(
                              context.read<TodolistCubit>(), state.holder[index].id);
                          context.read<TodoactivecountCubit>().refreshActiveCount();
                        });
                      }));
            },
          )
        ],
      ),
    );
  }
}
