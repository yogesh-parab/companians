import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Animal {
  String name;
  String type;
  String breed;
  String gender;
  String id;
  String groom;
  String feed1;
  String feed2;
  String vet1;
  String image;

  Animal({
    this.name,
    this.type,
    this.breed,
    this.gender,
    this.id,
    this.groom,
    this.feed1,
    this.feed2,
    this.vet1,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "type": type,
      "breed": breed,
      "gender": gender,
      "vet": vet1,
      "groom": groom,
      "feed1": feed1,
      "feed2": feed2,
      "image":image,
    };
  }

  Animal.fromFireStore(Map<String, dynamic> firestore)
      : id = firestore['id'],
        name = firestore['name'],
        type = firestore['type'],
        breed = firestore['breed'],
        gender = firestore['gender'],
        vet1=firestore['vet1'],
        groom=firestore['groom'],
       feed1=firestore['feed1'],
       feed2=firestore['feed2'],
       image=firestore['image'];
}
