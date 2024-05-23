import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:theme_switching/bloc/themebloc.dart';
import 'package:theme_switching/bloc/themebloc_state.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int incrementFactor = 0;
  //late StreamSubscription streamSubscription;
  late ThemeBloc themeBloc;
  CounterBloc() : super(CounterState(counterValue: 0)) {
    // streamSubscription = themeBloc.stream.listen((ThemeBlocState themeBlocState) {
    //   if (themeBlocState.theme == Colors.white) {
    //     incrementFactor = 1;
    //   } else if (themeBlocState.theme == Colors.black) {
    //     incrementFactor = -100;
    //     emit(CounterState(counterValue: state.counterValue + incrementFactor));
    //   } else if (themeBlocState.theme == Colors.green) {
    //     incrementFactor = 2;
    //   } else if (themeBlocState.theme == Colors.blue) {
    //     incrementFactor = 3;
    //   } else {
    //     incrementFactor = 4;
    //   }
    // });
    on<ChangeCounterValue>((event, emit) {
      emit(CounterState(counterValue: state.counterValue + event.incrementFactor));
    });
  }
}
