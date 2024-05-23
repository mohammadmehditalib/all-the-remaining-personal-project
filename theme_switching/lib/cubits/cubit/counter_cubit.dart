import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:theme_switching/cubits/cubit/theme_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  int incrementFactor = 0;
  late final StreamSubscription streamSubscription;
  late ThemeCubit themeCubit;

  CounterCubit({required this.themeCubit}) : super(CounterState(counterValue: 0)) {
    streamSubscription = themeCubit.stream.listen((ThemeState themeState) {
      if (themeState.theme == Colors.white) {
        incrementFactor = 1;
      } else if (themeState.theme == Colors.black) {
        incrementFactor = -100;
        emit(CounterState(counterValue: state.counterValue + incrementFactor));
      } else if (themeState.theme == Colors.green) {
        incrementFactor = 2;
      } else if (themeState.theme == Colors.blue) {
        incrementFactor = 3;
      } else {
        incrementFactor = 4;
      }
    });
  }

  void incrementCounter() {
    emit(CounterState(counterValue: state.counterValue + incrementFactor));
  }

  @override
  Future<void> close() {
    // TODO: implement close
    streamSubscription.cancel();
    return super.close();
  }
}
