import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/database.dart';
import 'package:todo/pages/dialog.dart';
import 'package:todo/pages/todo_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _taskController = TextEditingController();

  //creating the object for database reference
  ToDoDatabase db = ToDoDatabase();

  //Adding a reference to thw Hive db
  final _myBox = Hive.box('myBox');

  //Check the first time app open, if 1st time load the data
  @override
  void initState() {
    super.initState();
    if (_myBox.get(1) == null)
    //initiate the Data for the first time
    {
      db.createData();
    } else {
      //Already Exist
      db.loadData();
    }
  }

  // function to check and setState
  void checkTask(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  //Methods to create and delete Tasks
  saveTask() {
    setState(() {
      if (_taskController.text != "") {
        db.todoList.add([_taskController.text, false]);
      }
      _taskController.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  cancelTask() {
    Navigator.of(context).pop();
  }

  deleteFunc(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
//Method to create a task
    createTask() {
      showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            onSave: saveTask,
            onCancel: cancelTask,
            taskController: _taskController,
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text("ToDo List"),
        centerTitle: true,
        backgroundColor: Colors.yellow[400],
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.todoList[index][0],
            taskCompleted: db.todoList[index][1],
            onChanged: (value) {
              checkTask(value, index);
            },
            deleteTask: (context) => deleteFunc(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        elevation: 0,
        onPressed: createTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
