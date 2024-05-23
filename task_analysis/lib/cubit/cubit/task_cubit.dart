import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:task_analysis/Models/task.dart';

part 'task_state.dart';

List<Task> holder = [
  Task(serialNo: 1, description: 'HARKATE SUDHHARLO', isCompleted: false),
  Task(serialNo: 2, description: 'HARKATE SUDHHARLOfsahfjkhsakfha', isCompleted: false),
  Task(serialNo: 3, description: 'HARKATE SUDHHARLOfsaflsjfkfha', isCompleted: false),
];

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial(holder: holder));

  addTask(Task task) {
    state.holder.add(task);
    print(state.holder.length);

    emit(TaskAdded(holder: holder));
  }
   isCompletedToggle(Task task) {
     task.isCompleted=!task.isCompleted;
     emit(TaskAdded(holder: holder)); 

   }



}
