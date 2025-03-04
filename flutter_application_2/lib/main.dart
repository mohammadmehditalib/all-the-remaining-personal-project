import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/bloc/bloc/database_bloc.dart';
import 'package:flutter_application_2/bloc/bloc/weatherbloc_bloc.dart';
import 'package:flutter_application_2/firstpage.dart';
import 'package:flutter_application_2/services/database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /// dependency injections
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WeatherblocBloc()),
        BlocProvider(create: (_) => DatabaseBloc())
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          home: const FirstPage()),
    );
  }
}
