/*

TO DO VIEW: responsible for UI

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/domain/models/todolist.dart';
import 'package:todo_list_app/presentation/todolist_cubit.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  // we show dialog box for user to type
  void _showAddTodoBox(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    final textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(controller: textController),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),

          // add button
          TextButton(
            onPressed: () {
              todoCubit.addTodo(textController.text);
              Navigator.of(context).pop();
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  // BUILD UI
  @override
  Widget build(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 169, 213, 255),
        elevation: 7,
        title: Center(
            child: const Text(
          'Todo List',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
      backgroundColor: Color.fromARGB(255, 239, 248, 255),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 169, 213, 255),
        onPressed: () => _showAddTodoBox(context),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, todos) {
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ListTile(
                // text
                title: Text(
                  todo.text,
                  style: TextStyle(),
                ),

                // delete button
                trailing: IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () => todoCubit.deleteTodo(todo),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
