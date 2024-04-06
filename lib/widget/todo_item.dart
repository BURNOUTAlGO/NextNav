import 'package:flutter/material.dart';
import 'package:nextnav/constants/color.dart';
import 'package:nextnav/model/ToDo.dart';


class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;
  const ToDoItem ({Key? key, required this.todo,required this.onToDoChanged,required this.onDeleteItem,}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child:ListTile(
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        tileColor: Colors.black,
        leading: Icon(
          todo.isDone? Icons.check_box: Icons.check_box_outline_blank,
          color: tdGreen,size: 30,),
        title: Text(
          todo.todoText!,
          style: TextStyle(
            fontSize: 15,
            color: tdBGColor,
            decorationColor: Colors.white,
            decoration:  todo.isDone? TextDecoration.lineThrough:null,
          ),),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 15),
          height: 30,width: 30,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            padding: EdgeInsets.symmetric(horizontal: 1.5),
            color: Colors.white,
            iconSize: 20,
            icon: Icon(Icons.delete,),
            onPressed: (){
              onDeleteItem(todo.id);
            },
          ),
        ),
      )
    );
  }
}

//1554
