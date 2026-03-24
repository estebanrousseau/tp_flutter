import 'package:flutter/material.dart';
import 'package:tp21/models/task.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:tp21/models/todo.dart';

class MyAPI{
  Future<List<Task>> getTasks() async{
    await Future.delayed(Duration(seconds: 1));
    final dataString = await _loadAsset('assets/json/tasks.json');
    final Map<String,dynamic> json = jsonDecode(dataString);
    if (json['tasks']!=null){
      final tasks = <Task>[];
      json['tasks'].forEach((element){
        tasks.add(Task.fromJson(element));
      });
      return tasks;
    }else{
      return [];
    }
  }
  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }

  Future<List<Todo>> getTodos() async{
    await Future.delayed(Duration(seconds: 1));
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    if(response.statusCode == 200){
      final List<dynamic> json = jsonDecode(response.body);
       final todos = <Todo>[];
       for (var elem in json){
         todos.add(Todo.fromJson(elem));
       }
       return todos;
    }
    return <Todo>[];

  }






}