import 'dart:io';

import 'package:Final/Entitites/Animal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info/device_info.dart';

class FireStoreservice {
  
  
Future<String> _getId() async {

    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }
  FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<void> saveAnimal(Animal animal,String iid) async {
    _db.collection(iid).doc(animal.id).set(animal.toMap());
  }

  Stream<List<Animal>> getAnimals(String iid) {
    return _db.collection(iid).snapshots().map((snapshot) =>
        snapshot.docs
            .map((document) => Animal.fromFireStore(document.data()))
            .toList());
  }

  Future<void> removeProduct(String id,String iid) {
    return _db.collection(iid).doc(id).delete();
  }
}
