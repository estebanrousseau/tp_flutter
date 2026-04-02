import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp21/models/task.dart';

import 'ViewModel.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AddTask extends StatefulWidget{
  const AddTask({super.key});

  @override
  State<AddTask> createState() => AddTaskState();
}



class AddTaskState extends State<AddTask>{

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Center(

        child: FormBuilder(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              FormBuilderTextField(
                name: 'title',
                decoration: const InputDecoration(labelText: 'titre de la tache'),
                validator: FormBuilderValidators.compose([FormBuilderValidators.required(),
                ]),
              ),

              FormBuilderTextField(
                name: 'dificulté',
                decoration: const InputDecoration(labelText: 'dificulté de la tache'),
                validator: FormBuilderValidators.compose([FormBuilderValidators.required(),
                ]),
              ),

              FormBuilderTextField(
                name: 'tags',
                decoration: const InputDecoration(labelText: 'tags de la tache'),
                validator: FormBuilderValidators.compose([FormBuilderValidators.required(),
                ]),
              ),

              FormBuilderTextField(
                name: 'description',
                decoration: const InputDecoration(labelText: 'description'),
                validator: FormBuilderValidators.compose([FormBuilderValidators.required(),
                ]),
              ),

              FormBuilderTextField(
                name: 'nbhours',
                decoration: const InputDecoration(labelText: 'nombres d\'heures'),
                validator: FormBuilderValidators.compose([FormBuilderValidators.required(),
                ]),
              ),



              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.redAccent,
                  backgroundColor: Colors.lightBlue,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {

                    context.read<TaskViewModel>().insertTask(
                        Task.newTask_param(
                          _formKey.currentState?.fields['title']?.value,
                            (_formKey.currentState?.fields['tags']?.value as String)
                                .split(',')
                                .map((e) => e.trim())
                                .toList(),
                          int.parse(_formKey.currentState?.fields['nbhours']?.value,),
                          int.parse(_formKey.currentState?.fields['dificulté']?.value,),
                          _formKey.currentState?.fields['description']?.value

                        )
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text("Add Task"),
              ),
            ]
          )
        )
      ),
    ) ;
  }
}