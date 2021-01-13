import 'package:Final/Entitites/Animal.dart';
import 'package:Final/services/firestore_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AnimalProvider with ChangeNotifier {
  final String iid;
  final firestoreService = FireStoreservice();

  String _name;
  String _type;
  String _breed;
  String _gender;
  String _id;
  String _vet1;
  String _groom;
  String _feed1;
  String _feed2;
  String _image;
  var uuid = Uuid();

  AnimalProvider(this.iid);

  String get name => _name;
  String get type => _type;
  String get breed => _breed;
  String get gender => _gender;
  String get vet1 => _vet1;
  String get groom => _groom;
  String get feed1 => _feed1;
  String get feed2 => _feed2;
  String get image => _image;

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

  chnagevet(DateTime vet, DateTime groom, TimeOfDay feed1, TimeOfDay feed2,
      String image) {
    _vet1 = vet.toString();
    _groom = groom.toString();
    _feed1 = feed1.toString();
    _feed2 = feed2.toString();
    _image = image;
    notifyListeners();
  }

  loadValues(Animal animal) {
    _name = animal.name;
    _type = animal.type;
    _breed = animal.breed;
    _gender = animal.gender;
    _id = animal.id;
    _vet1 = animal.vet1;
    _groom = animal.groom;
    _feed1 = animal.feed1;
    _feed2 = animal.feed2;
    _image = animal.image;
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
        groom: groom,
        feed1: feed1,
        feed2: feed2,
        image: image,
      );
      firestoreService.saveAnimal(newAnimal,iid);
    } else {
      var updateAnimal = Animal(
        name: name,
        type: _type,
        breed: breed,
        gender: gender,
        id: _id,
        vet1: vet1,
        groom: groom,
        feed1: feed1,
        feed2: feed2,
        image: image,
      );
      firestoreService.saveAnimal(updateAnimal,iid);
    }
  }

  removeAnimal(String id) {
    firestoreService.removeProduct(id,iid);
  }
}
