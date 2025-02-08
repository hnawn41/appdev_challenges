/*

Todo repo 

here we can define what the app can do 
*/



import 'package:todo_list_app/domain/models/todolist.dart';

abstract class TodoRepo {
  // get a list of todos
  Future<List<Todo>> getTodos();

  // add a new todo
  Future<void> addTodo(Todo newTodo);

  // update an existing todo
  Future<void> updateTodo(Todo todo);

  // delete a todo
  Future<void> deleteTodo(Todo todo);
}




