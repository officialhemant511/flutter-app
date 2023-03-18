class toDo {
  String? id;
  String? TodoTxt;
  bool isDone;
  toDo({
    required this.id,
    required this.TodoTxt,
    this.isDone = false,
  });

  static List<toDo> todoList() {
    return [
      // toDo(id: "01", TodoTxt: "wake up at 5am morning",isDone: true),
      // toDo(id: "02", TodoTxt: "study accadmics",isDone: true),
      // toDo(id: "03", TodoTxt: "college"),
      // toDo(id: "04", TodoTxt: "Dsa"),
      // toDo(id: "05", TodoTxt: "revision"),
    ];
  }
}
