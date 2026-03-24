import 'package:flutter/material.dart';
import 'package:tp21/models/task.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:tp21/api/MyAPI.dart';


class Ecran3 extends StatelessWidget {

  Ecran3({super.key, required this.nom});

  final MyAPI myPAI = MyAPI();
  final String nom;


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: myPAI.getTodos(),
        builder: (context, snapshot){
          if(snapshot.connectionState!= ConnectionState.done && !snapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()));
          }

          if(snapshot.data != null){
            return ListView.builder(
                itemCount: snapshot.data?.length??0,
                itemBuilder: (BuildContext context, index){
                  return Card(
                      color: Colors.grey,
                      elevation: 7,
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                          leading: CircleAvatar(backgroundColor: Colors.blue,child:Text(snapshot.data?[index].id.toString()??""),),
                          title:Text(snapshot.data?[index].title??""),
                          subtitle: Text(snapshot.data?[index].userId.toString()??""),
                          trailing: IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {},
                          )
                      )
                  );
                }
            );
          }
          return Container();
        }
    );
  }
}