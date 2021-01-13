import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:Final/Entitites/Animal.dart';
import 'package:Final/Pages/add_pet.dart';
import 'package:provider/provider.dart';

class AnimalList extends StatefulWidget {
  const AnimalList({Key key}) : super(key: key);
  @override
  _AnimalListState createState() => _AnimalListState();
}

class _AnimalListState extends State<AnimalList> {
  /*static MemoryImage imageFromBase64String(String base64String) {
    return MemoryImage(base64Decode(base64String));
  }*/

  @override
  Widget build(BuildContext context) {
    final animals = Provider.of<List<Animal>>(context);

    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width,
      child: (animals != null)
          ? ListView.builder(
              itemCount: animals.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddPet(animals[index])));
                    },
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Image.network(
                            animals[index].image,
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.40,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.55,
                          height: MediaQuery.of(context).size.height * 0.15,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(15),
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(150))),
                          child: Align(alignment: Alignment.bottomLeft,
                            child: Padding(padding: EdgeInsets.all(20),
                                                          child: Text(
                                animals[index].name,
                                style: TextStyle(fontSize: 40,fontFamily:'blue',),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
