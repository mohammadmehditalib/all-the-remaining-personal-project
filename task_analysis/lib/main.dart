import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_analysis/cubit/cubit/task_cubit.dart';
import 'package:task_analysis/view/auth_screen.dart';
import 'package:task_analysis/view/first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /// dependency injection

    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => TaskCubit())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const FirstScreen(),
      ),
    );
  }
}


///////////////  m   dtata -bussinesss logic
///v c