import 'package:flutter/material.dart';
import 'package:tp21/models/task.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class Todo {
  int userId;
  int id;
  String title;
  bool completed;

  Todo({required this.id,required this.title,required this.userId,required this.completed});


  static Todo fromJson(Map<String, dynamic> json){

    return Todo(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        completed: json['completed'],
    );
  }
}

