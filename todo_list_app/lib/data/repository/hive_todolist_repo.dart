/*
Database repo 

This implements the TodoRepo interface and handles storing, retrieving, updating, and deleting in the Hive database.
*/

import 'package:hive/hive.dart';
import 'package:todo_list_app/data/models/hive_todolist.dart';
import 'package:todo_list_app/domain/models/todolist.dart';
import 'package:todo_list_app/domain/repository/todolist_repo.dart';


class HiveTodoRepo implements TodoRepo {

  final Box<TodoHive> todoBox;

  HiveTodoRepo(this.todoBox);

  // Get todos
  @override
  Future<List<Todo>> getTodos() async {
    final todos = todoBox.values.toList();

    return todos.map((todoHive) => todoHive.toDomain()).toList();
  }

  // Add a new todo
  @override
  Future<void> addTodo(Todo newTodo) async {
    final todoHive = TodoHive.fromDomain(newTodo);
    await todoBox.put(todoHive.id, todoHive);
  }

  // Update an existing todo
  @override
  Future<void> updateTodo(Todo todo) async {
    final todoHive = TodoHive.fromDomain(todo);
    await todoBox.put(todoHive.id, todoHive);
  }

  // Delete a todo
  @override
  Future<void> deleteTodo(Todo todo) async {
    await todoBox.delete(todo.id);
  }
}
