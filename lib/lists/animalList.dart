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
  @override
  Widget build(BuildContext context) {
    final animals = Provider.of<List<Animal>>(context);

    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width,
      child: (animals != null)
          ? ListView.builder(itemCount: animals.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddPet(animals[index])));
                    },
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white,),
                        
                        child: Column(
                          children: [
                            Text(animals[index].name),
                            Text(animals[index].type),
                            Text(animals[index].breed),
                            Text(animals[index].gender)
                          ],
                        )),
                  ),
                );
              },
              
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
