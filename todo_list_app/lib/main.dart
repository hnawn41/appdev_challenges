import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_list_app/data/models/hive_todolist.dart';
import 'package:todo_list_app/data/repository/hive_todolist_repo.dart';
import 'package:todo_list_app/domain/repository/todolist_repo.dart';
import 'package:todo_list_app/presentation/todolist_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  Hive.registerAdapter(TodoHiveAdapter());

  final todoBox = await Hive.openBox<TodoHive>('todos');

  final todoRepo = HiveTodoRepo(todoBox);

  runApp(TodoListApp(todoRepo: todoRepo));
}

class TodoListApp extends StatelessWidget {
  final HiveTodoRepo todoRepo;

  const TodoListApp({super.key, required this.todoRepo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoPage(todoRepo: todoRepo),
    );
  }
}
