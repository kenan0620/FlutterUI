import 'package:flutter/material.dart';

import 'NavigatorSmple.dart';

void main() {
  runApp(new TodoListVC(todos: new List.generate(100, (index) => new Todo(
    'Todo $index',
    'A description of what needs to be done for Todo $index',
  )),));
}
