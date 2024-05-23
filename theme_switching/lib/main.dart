import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_switching/bloc/bloc/bloc/counter_bloc.dart';
import 'package:theme_switching/bloc/themebloc.dart';
import 'package:theme_switching/cubits/cubit/counter_cubit.dart';
import 'package:theme_switching/cubits/cubit/theme_cubit.dart';
import 'package:theme_switching/firstpage.dart';

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
        BlocProvider(create: (_)=>ThemeBloc()),
        BlocProvider(create:(context)=> CounterBloc() )
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
