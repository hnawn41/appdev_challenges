import 'package:hive/hive.dart';
import 'package:todo_list_app/domain/models/todolist.dart';

// To generate the Hive adapter we run: dart run build_runner build
part 'hive_todolist.g.dart';

@HiveType(typeId: 0)
class TodoHive extends HiveObject {
  @HiveField(0)
  late String id; 

  @HiveField(1)
  late String text;

  Todo toDomain() {
    return Todo(id: id, text: text); 
  }

  static TodoHive fromDomain(Todo todo) {
    return TodoHive()
      ..id = todo.id 
      ..text = todo.text;
  }
}
