import 'package:flutter/material.dart';
import 'mytheme.dart';
import 'home.dart';
import 'package:provider/provider.dart';
import 'package:tp21/models/SettingRepository.dart';
import 'package:flutter/material.dart';
import 'package:tp21/mytheme.dart';
import 'package:tp21/models/ViewModel.dart';
import 'package:tp21/home.dart';


void main() {
  runApp(MyTD2());
}

class MyTD2 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_){
              SettingViewModel settingViewModel = SettingViewModel();
//getSettings est deja appelee dans le constructeur
              return settingViewModel;
            }),
        ChangeNotifierProvider(
            create:(_){
              TaskViewModel taskViewModel = TaskViewModel();
              taskViewModel.generateTasks();
              return taskViewModel;
            } )
      ],
      child: Consumer<SettingViewModel>(
        builder: (context,SettingViewModel notifier,child){
          return MaterialApp(
              theme: notifier.isDark ? MyTheme.dark():MyTheme.light(),
              title: 'TD2',
              home: MyHomePage()
          );
        },
      ),
    );
  }
}

