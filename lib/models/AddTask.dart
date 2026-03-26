import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp21/models/task.dart';

import 'ViewModel.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AddTask extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Center(

        child: Column(
          children: [

            FormBuilderTextField(
              name: 'title',
              decoration: const InputDecoration(labelText: 'titre de la tache'),
              obscureText: true,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),

            FormBuilderTextField(
              name: 'dificulté',
              decoration: const InputDecoration(labelText: 'dificulté de la tache'),
              obscureText: true,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),

            FormBuilderTextField(
              name: 'description',
              decoration: const InputDecoration(labelText: 'description'),
              obscureText: true,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),

            FormBuilderTextField(
              name: 'nbhours',
              decoration: const InputDecoration(labelText: 'nombres d\'heures'),
              obscureText: true,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),



            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.redAccent,
                backgroundColor: Colors.lightBlue,
              ),
              onPressed: () {
                context.read<TaskViewModel>().addTask(Task.newTask());
                Navigator.pop(context);
              },
              child: const Text("Add Task"),
            ),
          ]
        )
      ),
    ) ;
  }
}