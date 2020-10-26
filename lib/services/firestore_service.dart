import 'package:Final/Entitites/Animal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreservice {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<void> saveAnimal(Animal animal) {
    _db.collection('animals').doc(animal.id).set(animal.toMap());
  }

  Stream<List<Animal>> getAnimals() {
    return _db.collection('animals').snapshots().map((snapshot) => snapshot.docs
        .map((document) => Animal.fromFireStore(document.data()))
        .toList());
  }

  Future<void> removeProduct(String id) {
    return _db.collection('animals').doc(id).delete();
  }
}
