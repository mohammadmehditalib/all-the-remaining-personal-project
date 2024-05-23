import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_switching/bloc/bloc/bloc/counter_bloc.dart';
import 'package:theme_switching/bloc/themebloc.dart';
import 'package:theme_switching/bloc/themebloc_events.dart';
import 'package:theme_switching/bloc/themebloc_state.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    int incrementFactor = 0;

    return BlocConsumer<ThemeBloc, ThemeBlocState>(
      listener: (context, state) {
        if (state.theme == Colors.black) {
          incrementFactor = -100;
          context.read<CounterBloc>().add(ChangeCounterValue(incrementFactor: incrementFactor));
        } else if (state.theme == Colors.white) {
          incrementFactor = 1;
        } else if (state.theme == Colors.green) {
          incrementFactor = 2;
        } else if (state.theme == Colors.blue) {
          incrementFactor = 3;
        } else {
          incrementFactor = 4;
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state.theme,
          appBar: AppBar(title: const Text('Theme switching and counter switching')),
          body: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      context.read<ThemeBloc>().add(ChangeTheme());
                    },
                    child: const Text('Theme switching')),
                BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    return Text(
                      state.counterValue.toString(),
                      style: const TextStyle(color: Colors.white),
                    );
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      context
                          .read<CounterBloc>()
                          .add(ChangeCounterValue(incrementFactor: incrementFactor));
                    },
                    child: const Text('counter increment'))
              ],
            ),
          ),
        );
      },
    );
  }
}
