import 'package:flutter/material.dart';
import 'package:todo_task/cubits/cubit/searchcubit_cubit.dart';
import 'package:todo_task/cubits/cubit/todoactivecount_cubit.dart';
import 'package:todo_task/cubits/cubit/todolist_cubit.dart';
import 'package:todo_task/presentation/landing_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodolistCubit>(create: (_) => TodolistCubit()),
        BlocProvider<SearchcubitCubit>(create: (_) => SearchcubitCubit()),
        BlocProvider<TodoactivecountCubit>(
            create: (context) =>
                TodoactivecountCubit(todolistCubit: context.read<TodolistCubit>())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LandingPage(),
      ),
    );
  }
}
