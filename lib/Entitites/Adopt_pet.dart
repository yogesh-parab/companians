import 'package:flutter/material.dart';

class AdoptableAnimal {
  String id;
  String name;
  String type;
  String breed;
  String age;
  String address;
  String owner_name;
  String owner_no;
  String image;

  AdoptableAnimal(
      {@required this.id,
      @required this.name,
      @required this.type,
      @required this.breed,
      @required this.age,
      @required this.address,
      @required this.owner_name,
      @required this.owner_no,
      @required this.image});

  factory AdoptableAnimal.fromJson(dynamic json) {
    return AdoptableAnimal(
      id:"${json['id']}",
      name:"${json['name']}",
      type:"${json['type']}",
      breed:"${json['breed']}",
      age:"${json['age']}",
     address: "${json['address']}",
      owner_name:"${json['owner_name']}",
      owner_no:"${json['owner_no']}",
      image:"${json['image']}",
    );
  }

  // Method to make GET parameters.
  Map toJson() => {
        'id': id,
        'name': name,
        'type': type,
        'breed': breed,
        'age': age,
        'address': address,
        'owner_name': owner_name,
        'owner_no': owner_no,
        'image': image
      };
}
