import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class Task {
  int id;
  String title;
  List<String> tags;
  int nbhours;
  int difficulty;
  String description;
  Color color;
  static int nb = 0;

  Task({required this.id,required this.title,required this.tags,required
  this.nbhours,required this.difficulty,required this.description, required this.color});

  factory Task.newTask(){
    nb++; //attribut static de la classe.
    return Task(id: nb, title: 'title $nb', tags: ['tags $nb'], nbhours:
    nb, difficulty: nb%5, description: 'description $nb', color: Colors.red);
  }

  static List<Task> generateTask(int i){
    List<Task> tasks=[];
    for(int n=0;n<i;n++){
      //tasks.add(Task(id: n, title: "title $n", tags: ['tag $n','tag${n+1}'], nbhours: n, difficuty: n, description: '$n'));
      tasks.add(Task(id: n, title: "title $n", tags: ['tag $n','tag${n+1}'], nbhours: n, difficulty: n, description: 'une description qui tue', color: Colors.greenAccent));
    }
      return tasks;
  }

  static Task fromJson(Map<String, dynamic> json){
    final tags = <String>[];
    final Color clr;

    clr = Colors.greenAccent;

    if(json['tags'] != null){
      json['tags'].forEach((t){
        tags.add(t);
      });
    }

    return Task(
      id: json['id'],
      title: json['title'],
      tags: tags,
      nbhours: json['nbhours'],
      difficulty: json['difficulty'],
      description: json['description'],
      color: clr
    );
  }
  

}


