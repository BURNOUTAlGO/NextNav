import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nextnav/constants/color.dart';
import 'package:nextnav/model/ToDo.dart';
import 'package:nextnav/widget/todo_item.dart';



class Home extends StatefulWidget {
   Home({Key? key}): super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();
  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdgrey,     // this matches thee color same as app bar colour
      appBar: buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
            ),
            child: Column(
              children: [
               searchBox(),
               Expanded(
                 child: ListView(
                   children: [
                     Container(
                       margin: EdgeInsets.only(top:40 ,bottom:20 ),
                       child: Text('Your ToDos',style:TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: Colors.white),),
                     ),
                     for(ToDo todoo in _foundToDo.reversed)
                     ToDoItem(
                       todo: todoo,
                       onToDoChanged: _handleToDoChange,
                       onDeleteItem: _deleteToDoItem,
                     ),
                     ListTile(),
                   ],
                 ),
               )
           ],
              ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(child: Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                  left: 20,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.black,
                  boxShadow: const [BoxShadow(
                    color: tdBlack,offset:Offset(0.0,0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ),],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _todoController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Add Your Item',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                ),
                child:   ElevatedButton(
                  child: Text('+', style: TextStyle(fontSize: 40, color: Colors.black,),),
                  onPressed: (){
                    _addToDoItem(_todoController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tdGreen,
                    minimumSize: Size(20,20),
                    elevation: 10,
                  ),
                ),
              )
            ],),
          )
        ],
      ),
    );

  }
  void _handleToDoChange(ToDo todo){
    setState(() {
      todo.isDone=! todo.isDone;
    });
  }
  void _deleteToDoItem(String id){
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }
  void _addToDoItem(String toDo){
    setState(() {
      todosList.add(ToDo(id: DateTime.now().microsecondsSinceEpoch.toString(), todoText: toDo));
    });
    _todoController.clear();
  }
  void _runFilter(String enteredKeyword){
   List<ToDo> results = [];
   if(enteredKeyword.isEmpty){
     results = todosList;
   }else{
     results = todosList
         .where((item) => item.todoText!
         .toLowerCase()
         .contains(enteredKeyword.toLowerCase()))
         .toList();
   }
   setState(() {
     _foundToDo = results;
   });
  }

  Widget searchBox(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(25)
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdGrey,
            size: 22,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color:tdGrey),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: tdgrey,
      elevation: 0,     //this is statement is used to remove shadow bw appbar and rest screen
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        //Icon(Icons.menu,color: tdBGColor,size: 30,),
       // Padding(padding: EdgeInsets.(horizontal: 5)),
        Title(color: Colors.white, child: Text('Nextnave', style: TextStyle(fontSize: 30,color:tdGreen,fontWeight: FontWeight.w600),)),
        Container(
          height: 40,
          width:40 ,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/images/PSX_20231217_221859.jpg'),
          ),
        ),
      ],),
    );
  }
}
// 9:20