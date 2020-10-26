import 'package:Final/services/firestore_service.dart';
import 'package:Final/sidebar/sidebar_layout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/animal_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FireStoreservice();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AnimalProvider(),
        ),
        StreamProvider(create: (context)=>firestoreService.getAnimals()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SideBarLayout(),
      ),
    );
  }
}
