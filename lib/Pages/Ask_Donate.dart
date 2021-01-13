import 'dart:io';

import 'package:Final/Entitites/rescuers.dart';
import 'package:Final/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:Final/providers/Rescue_provider.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';

class Donate extends StatefulWidget with NavigationStates {
  @override
  _Donate createState() => _Donate();
}

class _Donate extends State<Donate> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var uuid = Uuid();

  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController requestController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();

  File _selectedFile;

  final picker = ImagePicker();

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
          height: MediaQuery.of(this.context).size.height * 0.15,
          width: MediaQuery.of(this.context).size.width * 0.3,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Image.asset(
          "assets/images/dd.png",
          height: MediaQuery.of(this.context).size.height * 0.15,
          width: MediaQuery.of(this.context).size.width * 0.3,
          fit: BoxFit.cover,
        ),
      );
    }
  }

  Future<String> uploadImageToFirebase(BuildContext context) async {
    String fileName = basename(_selectedFile.path);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('rescuers/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(_selectedFile);
    final ref = FirebaseStorage.instance.ref().child('rescuers/$fileName');

    var image = await ref.getDownloadURL();
    return image;
  }

  void _submitForm(String image,BuildContext context) {
    if (_formKey.currentState.validate()) {
      Rescue a = Rescue(
          id:uuid.v4(),
          name:nameController.text,
          address:addressController.text,
          amount:amountController.text,
          request:requestController.text,
          mobile:mobileNoController.text,
          image:image,);

      FormController formController = FormController();

      _showSnackbar("Submitting Feedback");

      // Submit 'feedbackForm' and save it in Google Sheets.
      formController.submitForm(a, (String response) {
        print("Response: $response");
        if (response == FormController.STATUS_SUCCESS) {
          // Feedback is saved succesfully in Google Sheets.
          _showSnackbar("Feedback Submitted");
          BlocProvider.of<NavigationBloc>(context)
              .add(NavigationEvents.HomePageClickedEvent);
        } else {
          // Error Occurred while saving data in Google Sheets.
          _showSnackbar("Error Occurred!");
        }
      });
    }
  }

  // Method to show snackbar with 'message'.
  _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(resizeToAvoidBottomInset: false,
resizeToAvoidBottomPadding: false,
      key: _scaffoldKey,
      
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        backgroundColor: Color(0xffBC0253),
        onPressed: () {
          BlocProvider.of<NavigationBloc>(context)
              .add(NavigationEvents.HomePageClickedEvent);
        },
      ),
      appBar: AppBar(
        backgroundColor: Color(0xffBC0253),
        title: Text(
          "Request a donation",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(reverse: true,
              child: Padding(padding: EdgeInsets.only(bottom: bottom),
                              child: Stack(children: [
          Image(
            image: AssetImage('assets/images/bg.png'),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Positioned(
                top: MediaQuery.of(context).size.height * 0.02,
                left: MediaQuery.of(context).size.width * 0.35,
                child: Row(
                  children: [
                    getimageWidget(),
                    Column(
                      children: [
                        IconButton(
                            icon: Icon(Icons.camera,
                                color: Color(0xffBC0253),
                                size: MediaQuery.of(context).size.height * 0.065),
                            onPressed: () {
                              getMyImage(ImageSource.camera);
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        IconButton(
                            icon: Icon(Icons.photo_album,
                                color: Color(0xffBC0253),
                                size: MediaQuery.of(context).size.height * 0.065),
                            onPressed: () {
                              getMyImage(ImageSource.gallery);
                            })
                      ],
                    ),
                  ],
                )),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width,
            child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Form(
                        key: _formKey,
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextFormField(
                                controller: nameController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Enter Valid Name';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(labelText: 'Name'),
                              ),
                        
                              TextFormField(
                                controller: addressController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Enter Valid address';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(labelText: 'address'),
                              ),
                              TextFormField(
                                controller: amountController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'enter valid amount';
                                  }
                                  return null;
                                },
                                decoration:
                                    InputDecoration(labelText: 'amount'),
                              ),TextFormField(
                                controller: requestController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'enter valid request';
                                  }
                                  return null;
                                },
                                decoration:
                                    InputDecoration(labelText: 'request'),
                              ),
                              TextFormField(
                                controller: mobileNoController,
                                validator: (value) {
                                  if (value.trim().length != 10) {
                                    return 'Enter 10 Digit Mobile Number';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Mobile Number',
                                ),
                              ),
                            ],
                          ),
                        )),
                    RaisedButton(
                      color: Color(0xffBC0253),
                      textColor: Colors.white,
                      onPressed: () async {
                        String image = await uploadImageToFirebase(context);
                        print(image);
                        _submitForm(image,context);
                      },
                      child: Text('Upload Request'),
                    ),
                  ]),
          )
        ]),
              ),
      ),
    );
  }
}
