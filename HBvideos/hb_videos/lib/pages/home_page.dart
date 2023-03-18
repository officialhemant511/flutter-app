import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hb_videos/contraints/colors.dart';
import 'package:hb_videos/models/todo.dart';
import 'package:hb_videos/widgets/toDolist.dart';

class MyhomePage extends StatefulWidget {
  @override
  State<MyhomePage> createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyhomePage> {
  final todoList = toDo.todoList();
  List<toDo> _tofoundTodo = [];
  final _todocontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _tofoundTodo = todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGcolor,
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 20),
                        child: Text(
                          "All ToDos",
                          style: TextStyle(
                              color: tdBlack,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      // for (toDo todoo in todoList)
                      for (toDo todoo in _tofoundTodo.reversed)
                        todoitems(
                          todo: todoo,
                          toDochange: _handleToDoChange,
                          // ontodochange :
                          toDOdelete: _todeletechange,
                        ),
                      // todoitems(),
                      // todoitems(),// this is a default calling
                      // todoitems(),
                      // todoitems(),
                    ],
                  ),
                )
              ]),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.only(
                        left: 10,
                        top: 5,
                        bottom: 2,
                      ),
                      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10.0,
                              spreadRadius: 1.0)
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: _todocontroller,
                        decoration: InputDecoration(
                            hintText: 'Add new Text', border: InputBorder.none),
                      ),
                    )),
                    Container(
                      margin: EdgeInsets.only(bottom: 20, right: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          _toAdditems(_todocontroller.text);
                        },
                        child: Text(
                          '+',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w300),
                        ),
                        // style: ElevatedButton.styleFrom(
                        //   elevation: 10,
                        // ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  void _handleToDoChange(toDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _todeletechange(String id) {
    setState(() {});
    todoList.removeWhere((item) => item.id == id);
  }

  void _toAdditems(String todo) {
    setState(() {
      todoList.add(toDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(), TodoTxt: todo));
    });
    _todocontroller.clear();
  }

  void _runfilter(String enteredKeyword) {
    List<toDo> res = [];
    if (enteredKeyword.isEmpty) {
      res = todoList;
    } else {
      res = todoList
          .where((item) => item.TodoTxt!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _tofoundTodo = res;
    });
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: TextField(
          onChanged: (value) => _runfilter(value),
          // scrollPadding: EdgeInsets.only(right: 111),
          decoration: InputDecoration(
            // contentPadding: EdgeInsets.only(left: 3.5, right: 56.3),
            prefixIcon: Icon(
              Icons.search,
              color: tdBlack,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(maxHeight: 50, maxWidth: 35),
            border: InputBorder.none,
            hintStyle: TextStyle(color: tdGrey),
            hintText: "search",
          )),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
        backgroundColor: tdBGcolor,
        elevation: 0, // to remove the shadow of title bar
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: Colors.black,
              size: 30,
            ),
            Text("TO DO APP", style: TextStyle(color: Colors.black)),
            Container(
              height: 40,
              width: 40,
              child: ClipRRect(
                  // for rectangular image or border
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset('assets/images/hi.png')),
            )
          ],
        ));
  }
}
