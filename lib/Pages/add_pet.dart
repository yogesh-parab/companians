import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:Final/Entitites/Animal.dart';
import 'package:Final/providers/animal_provider.dart';
import 'package:flutter/material.dart';
import 'package:Final/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:Final/notifications/notification_plugins.dart';

class AddPet extends StatefulWidget with NavigationStates {
  final Animal animal;

  AddPet([this.animal]);
  @override
  _AddPetState createState() => _AddPetState();
}

class _AddPetState extends State<AddPet> {
  DateTime vet;
  DateTime groom;
  TimeOfDay feed1;
  TimeOfDay feed2;
  bool isSwitched1 = true;
  String image;

  File _selectedFile;
  final picker = ImagePicker();

  onNotificationInLowerVersions(ReceivedNotification receivedNotification) {}
  onNotificationClick(String payload) {}

  static String base64String(Uint8List data) {
    return base64Encode(data);
  }

  getMyImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    if (pickedFile != null) {
      File cropped = await ImageCropper.cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
        maxHeight: 700,
        maxWidth: 700,
        compressFormat: ImageCompressFormat.jpg,
      );
      this.setState(() {
        _selectedFile = cropped;
      });
    }
  }

  Widget getimageWidget() {
    if (_selectedFile != null) {
      return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Image.file(
          _selectedFile,
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.3,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Image.asset(
          "assets/images/dd.png",
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.3,
          fit: BoxFit.cover,
        ),
      );
    }
  }

  final nameController = TextEditingController();
  final typeController = TextEditingController();
  final breedController = TextEditingController();
  final genderController = TextEditingController();

  void dispose() {
    nameController.dispose();
    typeController.dispose();
    breedController.dispose();
    genderController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.animal == null) {
      nameController.text = '';
      typeController.text = '';
      breedController.text = '';
      genderController.text = '';
      new Future.delayed(Duration.zero, () {
        final animalProvider =
            Provider.of<AnimalProvider>(context, listen: false);
        animalProvider.loadValues(Animal());
      });
    } else {
      nameController.text = widget.animal.name;
      typeController.text = widget.animal.type;
      breedController.text = widget.animal.breed;
      genderController.text = widget.animal.gender;
      //_selectedFile = widget.animal.image;
      new Future.delayed(Duration.zero, () {
        final animalProvider =
            Provider.of<AnimalProvider>(context, listen: false);
        animalProvider.loadValues(widget.animal);
      });
    }
    super.initState();
    vet = DateTime.now();
    groom = DateTime.now();
    feed1 = TimeOfDay.now();
    feed2 = TimeOfDay.now();
    notificationPlugin
        .setListenerForLowerVersions(onNotificationInLowerVersions);
    notificationPlugin.setOnNotificationClick(onNotificationClick);
  }

  @override
  Widget build(BuildContext context) {
    final animalProvider = Provider.of<AnimalProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image(
              image: AssetImage('assets/images/bg.png'),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Positioned(
                top: MediaQuery.of(context).size.height * 0.08,
                left: MediaQuery.of(context).size.width * 0.35,
                child: Row(
                  children: [
                    getimageWidget(),
                    Column(
                      children: [
                        IconButton(
                            icon: Icon(Icons.camera,
                                color: Color(0xffBC0253),
                                size:
                                    MediaQuery.of(context).size.height * 0.065),
                            onPressed: () {
                              getMyImage(ImageSource.camera);
                            }),
                        IconButton(
                            icon: Icon(Icons.photo_album,
                                color: Color(0xffBC0253),
                                size:
                                    MediaQuery.of(context).size.height * 0.065),
                            onPressed: () {
                              getMyImage(ImageSource.gallery);
                            })
                      ],
                    )
                  ],
                )),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.25,
              left: MediaQuery.of(context).size.width * 0.1,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      controller: nameController,
                      onChanged: (value) {
                        animalProvider.chnageName(value);
                      },
                      decoration: InputDecoration(hintText: 'Name'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      controller: typeController,
                      onChanged: (value) {
                        animalProvider.chnageType(value);
                      },
                      decoration: InputDecoration(hintText: 'type'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      controller: breedController,
                      onChanged: (value) {
                        animalProvider.chnageBreed(value);
                      },
                      decoration: InputDecoration(hintText: 'Breed'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      controller: genderController,
                      onChanged: (value) {
                        animalProvider.chnageGender(value);
                      },
                      decoration: InputDecoration(hintText: 'gender'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(
                      children: [
                        Text(" vet appointment :"),
                        IconButton(
                          onPressed: () async {
                            DateTime date = await showDatePicker(
                                context: context,
                                initialDate: vet,
                                firstDate: DateTime(DateTime.now().year - 5),
                                lastDate: DateTime(DateTime.now().year + 5));
                            if (date != null) {
                              setState(() {
                                vet = date;
                              });
                            }
                          },
                          icon: Icon(
                            Icons.calendar_today,
                            color: Color(0xffBC0253),
                          ),
                        ),
                        Expanded(child: Text(DateFormat.yMEd().format(vet)))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(
                      children: [
                        Text(" grooming appointment :"),
                        IconButton(
                          onPressed: () async {
                            DateTime date = await showDatePicker(
                              context: context,
                              initialDate: groom,
                              firstDate: DateTime(DateTime.now().year - 5),
                              lastDate: DateTime(DateTime.now().year + 5),
                            );
                            if (date != null) {
                              setState(() {
                                groom = date;
                              });
                            }
                          },
                          icon: Icon(
                            Icons.calendar_today,
                            color: Color(0xffBC0253),
                          ),
                        ),
                        Expanded(child: Text(DateFormat.yMEd().format(groom)))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(1),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(children: [
                      Text('meal 1:'),
                      IconButton(
                          icon: Icon(
                            Icons.access_time,
                            color: Color(0xffBC0253),
                          ),
                          onPressed: () async {
                            TimeOfDay t = await showTimePicker(
                                context: context, initialTime: feed1);
                            if (t != null) {
                              setState(() {
                                feed1 = t;
                              });
                            }
                          }),
                      Container(
                          height: 20,
                          width: 50,
                          decoration: BoxDecoration(
                              border: Border.all(
                            width: 2,
                            color: Color(0xffBC0253),
                          )),
                          child: Center(
                              child: Text("${feed1.hour}:${feed1.minute}"))),
                    ]),
                  ),
                  Container(
                    padding: EdgeInsets.all(1),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(children: [
                      Text('meal 2:'),
                      IconButton(
                          icon: Icon(
                            Icons.access_time,
                            color: Color(0xffBC0253),
                          ),
                          onPressed: () async {
                            TimeOfDay t = await showTimePicker(
                                context: context, initialTime: feed2);
                            if (t != null) {
                              setState(() {
                                feed2 = t;
                              });
                            }
                          }),
                      Container(
                          height: 20,
                          width: 50,
                          decoration: BoxDecoration(
                              border: Border.all(
                            width: 2,
                            color: Color(0xffBC0253),
                          )),
                          child: Center(
                              child: Text("${feed2.hour}:${feed2.minute}"))),
                    ]),
                  ),
                ],
              ),
            ),
            (widget.animal != null)
                ? Positioned(
                    bottom: MediaQuery.of(context).size.height * 0.02,
                    right: MediaQuery.of(context).size.width * 0.375,
                    child: RaisedButton(
                      onPressed: () {
                        animalProvider.removeAnimal(widget.animal.id);
                        if (widget.animal == null) {
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.HomePageClickedEvent);
                        } else {
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text(
                        'Delete',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Color(0xffBC0253),
                    ))
                : Container(),
            Positioned(
                bottom: MediaQuery.of(context).size.height * 0.02,
                left: MediaQuery.of(context).size.width * 0.1,
                child: RaisedButton(
                  onPressed: () {
                    if (widget.animal == null) {
                      BlocProvider.of<NavigationBloc>(context)
                          .add(NavigationEvents.HomePageClickedEvent);
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(
                    'Back',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Color(0xffBC0253),
                )),
            Positioned(
                bottom: MediaQuery.of(context).size.height * 0.02,
                right: MediaQuery.of(context).size.width * 0.08,
                child: RaisedButton(
                  onPressed: () async {
                    image = base64String(_selectedFile.readAsBytesSync());

                    //await notificationPlugin.showNotification();
                    await notificationPlugin.showDailyAtTime(
                        feed1, "${nameController.text} is hungry");
                    await notificationPlugin.showDailyAtTime(
                        feed2, "${nameController.text} is hungry");
                    await notificationPlugin.scheduleNotification(groom,
                        "${nameController.text} has a vet grooming today");

                    await notificationPlugin.scheduleNotification(vet,
                        "${nameController.text} has a vet appointment today");
                    animalProvider.chnagevet(vet, groom, feed1, feed2, image);
                    animalProvider.saveProduct();
                    if (widget.animal == null) {
                      BlocProvider.of<NavigationBloc>(context)
                          .add(NavigationEvents.HomePageClickedEvent);
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Color(0xffBC0253),
                )),
            Positioned(
              right: MediaQuery.of(context).size.width * 0.15,
              bottom: MediaQuery.of(context).size.height * 0.125,
              child: Switch(
                value: isSwitched1,
                onChanged: null,
              ),
            )
          ],
        ),
      ),
    );
  }
}
