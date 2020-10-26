import 'dart:ui';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:Final/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Final/Entitites/Adopt_pet.dart';

class Adopt extends StatefulWidget with NavigationStates {
  @override
  _AdoptState createState() => _AdoptState();
}

class _AdoptState extends State<Adopt> {
  List<AdoptableAnimal> adoptList = List<AdoptableAnimal>();

  String url =
      "https://script.google.com/macros/s/AKfycbwEl2uTHn67dlKDedEy87q_EWAt47kL4UaeAnSmQ7SmFuX0j58/exec";

  Future<List<AdoptableAnimal>> getFeedbackList() async {
    return await http.get(url).then((response) {
      var jsonFeedback = convert.jsonDecode(response.body) as List;
      return jsonFeedback
          .map((json) => AdoptableAnimal.fromJson(json))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();

    getFeedbackList().then((feedbackItems) {
      setState(() {
        this.adoptList = feedbackItems;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        backgroundColor: Color(0xffBC0253),
        onPressed: () {
          BlocProvider.of<NavigationBloc>(context)
              .add(NavigationEvents.HomePageClickedEvent);
        },
      ),
      appBar: AppBar(
        backgroundColor: Color(0xffBC0253),
        title: Text(
          "Bring home a pet today",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          Image(
            image: AssetImage('assets/images/bg.png'),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: adoptList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            "${adoptList[index].image}",
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.2,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.16,
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.fromLTRB(10,5,5,0),
                                  child: Text(
                                    '${adoptList[index].name}' +
                                        " " +
                                        "(" +
                                        "${adoptList[index].age}" +
                                        ")",
                                    style: TextStyle(fontSize: 20),
                                  )),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(10, 5, 5, 0),
                                  child: Text("${adoptList[index].type}"+" : "+'${adoptList[index].breed}')),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(10, 5, 5, 0),
                                  child: Text('${adoptList[index].address}')),
                              Padding(padding: EdgeInsets.fromLTRB(10, 5, 5, 0),
                                                              child: Row(
                                  children: [
                                    Icon(Icons.phone_in_talk),
                                    Text("${adoptList[index].owner_no}")
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
