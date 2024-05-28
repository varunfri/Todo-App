import "package:hive_flutter/hive_flutter.dart";

class ToDoDatabase {
  List todoList = [];

  //reference the box created
  final _myBox = Hive.box('myBox');

  //run the method when first we use app
  void createData() {
    todoList = [
      ["ToDo-List", false],
      ["Add Task", false],
      ["Scroll left to delete task", false],
    ];
    _myBox.put(1, todoList);
  }

  // function to load the data
  void loadData() {
    todoList = _myBox.get(1);
  }

  void updateData() {
    _myBox.put(1, todoList);
  }
}//EOF
