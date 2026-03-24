import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp21/models/task.dart';

import 'models/ViewModel.dart';


class Ecran1 extends StatelessWidget{
  late List<Task> tasks; //= Task.generateTask(50);
  String tags='';
  @override
  Widget build(BuildContext context) {
    tasks = context.watch<TaskViewModel>().liste;

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (BuildContext context , int index){
        return Card(
          color: Colors.white,
          elevation: 7,
          margin: const EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(backgroundColor: Colors.greenAccent,child:Text(tasks[index].id.toString()),),
            title:Text(tasks[index].title),
            subtitle: Text(tasks[index].tags.join(" ")),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {},
            ),
          ),

        );
      }

    );
  }
}