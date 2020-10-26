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
  @override
  Widget build(BuildContext context) {
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
        iconSize: 32,
        backgroundColor: Color(0xffBC0253),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.pink[100],
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            title: Text('shop'),
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('maps'),
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            title: Text('pets'),
            backgroundColor: Color(0xffBC0253),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            title: Text('tips'),
            backgroundColor: Color(0xffBC0253),
          ),
        ],
      ),
      body: Stack(
        children: [
          Image(
            image: NetworkImage(
                "https://images.pexels.com/photos/220938/pexels-photo-220938.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      child: Image(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.7,
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/bg.png'),
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      topLeft: Radius.circular(40.0),
                    ))),
          ),Positioned(bottom:0,child: AnimalList()),
        ],
      ),
    );
  }
}
