import 'package:flutter/material.dart';
import 'package:tp21/ecran_1.dart';
import 'package:tp21/ecran_2.dart';
import 'package:tp21/ecran_3.dart';
import 'package:tp21/EcranSettings.dart';

import 'models/AddTask.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _index = 0;

  List<Widget> pages = <Widget>[
    Ecran1(),
    Ecran2(nom: 'ecran 2'),
    Ecran3(nom: 'ecran 3'),
    EcranSettings(),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("td2", style: Theme.of(context).appBarTheme.titleTextStyle),
      ),
      body:
      pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        unselectedItemColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,

        onTap: _onItemTapped,
        currentIndex: _index,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting')
        ],
      ),
      floatingActionButton: _index==0?FloatingActionButton(
        onPressed: (){Navigator.push(context, MaterialPageRoute(
          builder: (context) => AddTask(),
        )
        );},
        child: const Icon(Icons.add),):const SizedBox.shrink(),
    );
  }
}






