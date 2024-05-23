import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_task/models/taskmodel.dart';

part 'todolist_state.dart';

enum Filters { all, active, completed }

class TodolistCubit extends Cubit<TodolistState> {
  TodolistCubit()
      : super(TodolistState(holder: [
          Taskmodel(active: false, description: 'Clean the model', id: 0),
          Taskmodel(active: false, description: 'Wash the dish', id: 1),
          Taskmodel(active: false, description: 'Do homework', id: 2)
        ]));

  void toggleAcivityStatus(TodolistCubit todolistCubit, int id) {
    for (int i = 0; i < todolistCubit.state.holder.length; i++) {
      if (todolistCubit.state.holder[i].id == id) {
        todolistCubit.state.holder[i].active = !todolistCubit.state.holder[i].active;
      }
    }

    emit(TodolistState(holder: state.holder));
  }
}
