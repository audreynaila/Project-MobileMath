// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:untitled3/home.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: TodoList(title: "title"),
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({super.key, required this.title});

  final String title;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List<Todo> _todos = <Todo>[];
  final TextEditingController _textControler = TextEditingController();

  void _addTodoItem(String name) {
    setState(() {
      _todos.add(Todo(name: name, completed: false));
    });
    _textControler.clear();
  }

  void _checkboxhandle(Todo todo) {
    setState(() {
      todo.completed = !todo.completed;
    });
  }

  void _deleteTodo(Todo todo) {
    setState(() {
      _todos.removeWhere((element) => element.name == todo.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(240, 0, 0, 0),
        title: Text("ToDo Manage",style: TextStyle(color: Colors.white70),),
        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.arrow_back), // Icon kembali ke halaman utama
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: _todos.map((Todo todo) {
          return TodoItem(
              todo: todo,
              onTodoChanged: _checkboxhandle,
              removeTodo: _deleteTodo);
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openDialog(),
        tooltip: 'Add a Todo',
        child: const Icon(Icons.add),
        backgroundColor: Colors.grey,
      ),
    );
  }

  Future openDialog() async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Todo'),
        content: TextField(
          controller: _textControler,
          autofocus: true,
          decoration: InputDecoration(hintText: 'Enter Todo'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _addTodoItem(_textControler.text);
            },
            child: Text('Add'),
          ),
          OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'))
        ],
      ),
    );
  }
}

class Todo {
  Todo({required this.name, required this.completed});
  String name;
  bool completed;
}

class TodoItem extends StatelessWidget {
  TodoItem(
      {super.key,
      required this.todo,
      required this.onTodoChanged,
      required this.removeTodo});
  final Todo todo;
  final void Function(Todo todo) onTodoChanged;
  final void Function(Todo todo) removeTodo;

  TextStyle? _getTextStyle(bool checked) {
    if (!checked) return null;
    return TextStyle(decoration: TextDecoration.lineThrough);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: Colors.amber.shade200,
        onTap: () {
          onTodoChanged(todo);
        },
        leading: Checkbox(
          value: todo.completed,
          onChanged: (value) {
            onTodoChanged(todo);
          },
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                todo.name,
                style: _getTextStyle(todo.completed),
              ),
            ),
            IconButton(
              onPressed: () {
                removeTodo(todo);
              },
              alignment: Alignment.centerRight,
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
