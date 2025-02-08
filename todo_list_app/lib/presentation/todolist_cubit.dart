/*

TO DO CUBIT - simple state management

Each cubit is a list of todos.

*/

import 'package:bloc/bloc.dart';
import 'package:todo_list_app/domain/models/todolist.dart';
import 'package:todo_list_app/domain/repository/todolist_repo.dart';
import 'package:uuid/uuid.dart';

class TodoCubit extends Cubit<List<Todo>> {
  final TodoRepo todoRepo;

  // Constructor initializes the cubit with an empty list
  TodoCubit(this.todoRepo) : super([]) {
    loadTodos();
  }

  Future<void> loadTodos() async {
    final todoList = await todoRepo.getTodos();
    emit(todoList);
  }

  

  Future<void> addTodo(String text) async {
    final newTodo = Todo(
    id: const Uuid().v4(), // Generate a unique string ID
    text: text,
  );
  await todoRepo.addTodo(newTodo);
  loadTodos();
}




  Future<void> deleteTodo(Todo todo) async {
    await todoRepo.deleteTodo(todo);
    loadTodos();
  }

}
