import 'package:flutter/cupertino.dart';
import 'package:nextnav/constants/color.dart';

class ToDo {
  String? id ;
  String? todoText ;
  bool isDone ;
  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false ,
});
  static List<ToDo> todoList(){
    return[
      ToDo(id: '01', todoText: 'Checking Emails', isDone: true),
      ToDo(id: '02', todoText: 'Java Complete ARRAY', isDone: true),
      ToDo(id: '03', todoText: 'laplace transformation ',),
      ToDo(id: '04', todoText: ' Work on nextnav',),
      ToDo(id: '05', todoText: 'Learning flutter',),
    ];
  }

}