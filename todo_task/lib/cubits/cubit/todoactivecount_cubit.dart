import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_task/cubits/cubit/todoactivecount_state.dart';
import 'package:todo_task/cubits/cubit/todolist_cubit.dart';

class TodoactivecountCubit extends Cubit<TodoactivecountState> {
  late StreamSubscription streamSubscription;
  late TodolistCubit todolistCubit;
  int count = 0;

  TodoactivecountCubit({required this.todolistCubit})
      : super(TodoactivecountState(activeCount: 0)) {
    // count = 0;
    // for (int i = 0; i < todolistCubit.state.holder.length; i++) {
    //   if (!todolistCubit.state.holder[i].active) {
    //     count++;
    //   }
    // }
    // emit(TodoactivecountState(activeCount: count));
  }

  void refreshActiveCount() {
    streamSubscription = todolistCubit.stream.listen((TodolistState todolistState) {
      count = 0;
      for (int i = 0; i < todolistState.holder.length; i++) {
        if (! todolistState.holder[i].active) {
          count++;
        }
      }
      emit(TodoactivecountState(activeCount: count));
    });
    
  }
}
