import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_list_app/app.dart';
import 'package:todo_list_app/core/di/app_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  configureDependencies();
  runApp(const TodoListApp());
}
