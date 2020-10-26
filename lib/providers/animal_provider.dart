import 'package:Final/Entitites/Animal.dart';
import 'package:Final/services/firestore_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AnimalProvider with ChangeNotifier {
  final firestoreService = FireStoreservice();

  String _name;
  String _type;
  String _breed;
  String _gender;
  String _id;
  DateTime _vet1;
  DateTime _groom;
  TimeOfDay _feed1;
  TimeOfDay _feed2;
  var uuid = Uuid();

  String get name => _name;
  String get type => _type;
  String get breed => _breed;
  String get gender => _gender;
  DateTime get vet1 => _vet1;
  DateTime get groom => _groom;
  TimeOfDay get feed1 => _feed1;
  TimeOfDay get feed2 => _feed2;

  chnageName(String val) {
    _name = val;
    notifyListeners();
  }

  chnageType(String val) {
    _type = val;
    notifyListeners();
  }

  chnageBreed(String val) {
    _breed = val;
    notifyListeners();
  }

  chnageGender(String val) {
    _gender = val;
    notifyListeners();
  }

  chnagevet(
    DateTime vet,
    DateTime groom,
    TimeOfDay feed1,
    TimeOfDay feed2,
  ) {
    _vet1 = vet;
    //_groom = groom;
    //_feed1 = feed1;
    //_feed2 = feed2;
    notifyListeners();
  }

  loadValues(Animal animal) {
    _name = animal.name;
    _type = animal.type;
    _breed = animal.breed;
    _gender = animal.gender;
    _id = animal.id;
    _vet1 = animal.vet1;
    _groom = animal.grooming;
    _feed1 = animal.feed1;
    _feed2 = animal.feed2;
  }

  saveProduct() {
    print(_id);
    if (_id == null) {
      var newAnimal = Animal(
        name: name,
        type: type,
        breed: breed,
        gender: gender,
        id: uuid.v4(),
        vet1: vet1,
        grooming: groom,
        feed1: feed1,
        feed2: feed2,
      );
      firestoreService.saveAnimal(newAnimal);
    } else {
      var updateAnimal = Animal(
        name: name,
        type: _type,
        breed: breed,
        gender: gender,
        id: _id,
        vet1: vet1,
        grooming: groom,
        feed1: feed1,
        feed2: feed2,
      );
      firestoreService.saveAnimal(updateAnimal);
    }
  }

  removeAnimal(String id) {
    firestoreService.removeProduct(id);
  }
}
