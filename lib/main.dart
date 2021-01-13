import 'dart:io';

import 'package:Final/services/firestore_service.dart';
import 'package:Final/sidebar/sidebar_layout.dart';
import 'package:device_info/device_info.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/animal_provider.dart';

void main() async {
  String deviceId;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

  deviceId = await _getId();

  runApp(MyApp(deviceId:deviceId));
}

class MyApp extends StatelessWidget {
  final String deviceId;

  const MyApp({Key key, this.deviceId}) : super(key: key);
  


  @override
  Widget build(BuildContext context) {
    final firestoreService = FireStoreservice();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AnimalProvider(deviceId),
        ),
        StreamProvider(create: (context) => firestoreService.getAnimals(deviceId)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SideBarLayout(),
      ),
    );
  }
}
