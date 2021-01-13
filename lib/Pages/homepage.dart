import 'package:Final/Pages/Adopt.dart';
import 'package:Final/Pages/Breeds.dart';
import 'package:Final/Pages/Maps.dart';
import 'package:Final/Pages/Tips.dart';
import 'package:Final/Pages/myPetChart.dart';
import 'package:Final/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:Final/lists/animalList.dart';
import 'package:flutter/material.dart';
import 'package:Final/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget with NavigationStates {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  
  List<Widget> widgetOption = [myPetChart(),Help(),Breeds(),Tips()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    onTap1(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffBC0253),
        child: Icon(Icons.add),
        shape: CircleBorder(side: BorderSide(color: Colors.white, width: 3.0)),
        onPressed: () {
          BlocProvider.of<NavigationBloc>(context)
              .add(NavigationEvents.AddPetClickedEvent);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        iconSize: 32,
        backgroundColor: Color(0xffBC0253),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.pink[100],
        onTap: onTap1,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'maps',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'pets',
            backgroundColor: Color(0xffBC0253),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'tips',
            backgroundColor: Color(0xffBC0253),
          ),
        ],
      ),
           body: widgetOption.elementAt(_selectedIndex),);
  }
}
