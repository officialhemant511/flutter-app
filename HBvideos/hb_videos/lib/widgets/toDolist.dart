import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:hb_videos/contraints/colors.dart';

import '../models/todo.dart';

class todoitems extends StatelessWidget {
  final toDo todo;
  final toDochange;
  final toDOdelete;

  const todoitems(
      {Key? key,
      required this.todo,
      required this.toDochange,
      required this.toDOdelete})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool f = true;
    return Card(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        child: ListTile(
          onTap: () => {toDochange(todo)},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding: EdgeInsets.all(8),
          tileColor: Colors.white,
          leading: Icon(
            todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: Colors.blue,
          ),
          title: Container(
            child: Text(
              todo.TodoTxt!,
              style: todo.isDone
                  ? TextStyle(
                      color: tdBlack, decoration: TextDecoration.lineThrough)
                  : TextStyle(
                      color: tdBlack,
                    ),
            ),
          ),
          trailing: Container(
            // color: Colors.red,
            height: 35,
            width: 35,
            // margin: EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(20)),
            child: IconButton(
              // color: Colors.red,
              iconSize: 20,
              onPressed: () {
                toDOdelete(todo.id);
              },
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),
        ));
  }
}
