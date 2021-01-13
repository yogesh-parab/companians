import 'package:Final/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class Tips extends StatefulWidget with NavigationStates {
  @override
  _TipsState createState() => _TipsState();
}

class _TipsState extends State<Tips> {
  _launchBMI() async {
  const url = 'https://tractive.com/bmi';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_launchSnacks() async {
  const url = 'https://raleighncvet.com/nutrition-weight-management/11-healthy-natural-treats-for-dogs-in-your-kitchen/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchCvD() async {
  const url = 'https://www.purina.co.uk/cats/getting-a-new-cat/finding-the-right-cat-for-me/dog-or-cat-how-to-choose-the-right-pet-for-you';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchPotty() async {
  const url = 'https://www.humanesociety.org/resources/how-housetrain-your-dog-or-puppy';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchDeworm() async {
  const url = 'https://www.revivalanimal.com/pet-health/worming-schedule/learning-center';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffBC0253),
        title: Text(
          "Tips and Tricks",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(children: [
        Image(
          image: AssetImage('assets/images/bg.png'),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    GestureDetector(
                                          child: Card(
                        child: ListTile(title: Text('Calculate BMI'),
                          tileColor: Colors.white,
                          leading: Icon(Icons.policy),
                        ),
                      ),
                    onTap: _launchBMI,),
                    GestureDetector(onTap: _launchSnacks,
                                          child: Card(
                        child: ListTile(title: Text('Healthy all time snacks'),
                          tileColor: Colors.white,
                          leading: Icon(Icons.policy),
                        ),
                      ),
                    ),
                    GestureDetector(onTap: _launchCvD,
                                          child: Card(
                        child: ListTile(title: Text('Cats vs Dogs'),
                          tileColor: Colors.white,
                          leading: Icon(Icons.policy),
                        ),
                      ),
                    ),GestureDetector(onTap:_launchPotty ,
                                          child: Card(
                        child: ListTile(title: Text('Potty training 101'),
                          tileColor: Colors.white,
                          leading: Icon(Icons.policy),
                        ),
                      ),
                    ),GestureDetector(onTap: _launchDeworm,
                                          child: Card(
                        child: ListTile(title: Text('Deworming and Vaccinations'),
                          tileColor: Colors.white,
                          leading: Icon(Icons.policy),
                        ),
                      ),
                    ),
                  ],
                ))),
      ]),
    );
  }
}
