import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/bloc/bloc/database_bloc.dart';
import 'package:flutter_application_2/bloc/bloc/weatherbloc_bloc.dart';
import 'package:flutter_application_2/secondpage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController textEditingController = TextEditingController();
  StreamController streamController = StreamController();
  @override
  void initState() {
    context.read<WeatherblocBloc>().add(WeatherblocInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Weather Application'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            decoration: const InputDecoration(hintText: 'ENTER CITY NAME TO FETCH DATA '),
            controller: textEditingController,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            ElevatedButton(                                   
                onPressed: () async {
                  ReceivePort receivePort = ReceivePort();
                  await Isolate.spawn(task, receivePort.sendPort);
                  receivePort.listen((message) {
                    print(message);
                  });
                },
                child: const Text('Creating a separate isoloate')),
            ElevatedButton(
                onPressed: () => {
                      context
                          .read<WeatherblocBloc>()
                          .add(WeatherblocfetchingEvent(textEditingController.text))
                    },
                child: const Text('PRESS')),
            ElevatedButton(
                onPressed: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const Enteries())),
                      context.read<DatabaseBloc>().add(DatabaseFetchingEvent()),
                    },
                child: const Text('PAST SEARCH HISTORY')),
          ]),
          BlocBuilder<WeatherblocBloc, WeatherblocState>(builder: (context, state) {
            if (state is Weatherblocfetching) {
              return const CircularProgressIndicator();
            } else if (state is Weatherblocfetched) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '${state.currentTemp}°C',
                    style: const TextStyle(fontSize: 50),
                  ),
                  ClipRRect(child: Image.network('http:${state.image}')),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'max ${state.maxTemp}°C',
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text('min ${state.minTemp}°C',
                                style: const TextStyle(color: Colors.white))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Wind ${state.windSpeed}km/hr',
                                style: const TextStyle(color: Colors.white)),
                            Text('Humidity   ${state.humidity}%',
                                style: const TextStyle(color: Colors.white))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              );
            } else if (state is WeatherblocfetchingError) {
              return showCustomizedDialog(context);
              //return const SizedBox.shrink();
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Enter city name to find it' 's current temperature'),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Please enter the city name '),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    decoration: const BoxDecoration(
                        color: Colors.blueGrey,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text(
                              'max temperature',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text('min temperature', style: TextStyle(color: Colors.white))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text('wind speed', style: TextStyle(color: Colors.white)),
                            Text('Humidity', style: TextStyle(color: Colors.white))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              );
            }
          }),
        ],
      ),
    );
  }

  Widget showCustomizedDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('invalid city name  '),
      actions: [
        ElevatedButton(
            onPressed: () => {
                  //setState(() {
                  context.read<WeatherblocBloc>().add(WeatherblocInitialEvent())
                  //})
                },
            child: const Text('Dismiss'))
      ],
    );
  }
}

task(SendPort sendPort) {
  int total = 0;
  for (int i = 0; i < 10000000; i++) {
    total = total + i;
  }
  sendPort.send(total);
}
