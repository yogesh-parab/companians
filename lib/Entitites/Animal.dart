import 'dart:io';

import 'package:flutter/material.dart';

class Animal {
  String name;
  String type;
  String breed;
  String gender;
  String id;
  DateTime grooming;
  TimeOfDay feed1;
  TimeOfDay feed2;
  DateTime vet1;
  File image;

  Animal({
    this.name,
    this.type,
    this.breed,
    this.gender,
    this.id,
    this.grooming,
    this.feed1,
    this.feed2,
    this.vet1,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "type": type,
      "breed": breed,
      "gender": gender,
      "vet": vet1,
      "grooming": grooming,
      "feed1": feed1,
      "feed2": feed2,
    };
  }

  Animal.fromFireStore(Map<String, dynamic> firestore)
      : id = firestore['id'],
        name = firestore['name'],
        type = firestore['type'],
        breed = firestore['breed'],
        gender = firestore['gender'],
        vet1=firestore['vet1'],
        grooming=firestore['grooming'],
       feed1=firestore['feed1'],
       feed2=firestore['feed2'];
}
