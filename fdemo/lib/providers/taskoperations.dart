

import 'package:fdemo/providers/task.dart';
import 'package:flutter/material.dart';

class taskOpeartions extends ChangeNotifier{

List<Task> data=[];



addTask(String taskname,String description){

  Task obj=new Task(task: taskname, description: description);
  data.add(obj);
  notifyListeners();
   
}
removeTask(int index){

 data.removeAt(index);
 notifyListeners();
}


}