import 'package:counter_application/bloc/bloc/counterbloc_bloc.dart';
import 'package:counter_application/bloc/bloc/counterbloc_state.dart';
import 'package:counter_application/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Application')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Txt for conter values'),
            BlocConsumer<CounterblocBloc, CounterblocState>(
              builder: (context, state) {
                return Text(
                  state.countervalue.toString(),
                  style: const TextStyle(fontSize: 30),
                );
              },
              listener: (context, state) {
                if (state.countervalue == 5) {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const SecondPage()));
                }
                if (state.countervalue < 0) {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return const AlertDialog(content: Text('value is negative'));
                      });
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                    heroTag: null,
                    onPressed: () =>
                        {context.read<CounterblocBloc>().add(CounterIncrementPressed())},
                    child: const Text('+')),
                FloatingActionButton(
                    heroTag: null,
                    onPressed: () =>
                        {context.read<CounterblocBloc>().add(CounterDecrementPressed())},
                    child: const Text('-'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
