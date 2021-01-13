import 'package:Final/lists/animalList.dart';
import 'package:flutter/material.dart';

class myPetChart extends StatefulWidget {
  @override
  _myPetChartState createState() => _myPetChartState();
}

class _myPetChartState extends State<myPetChart> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: NetworkImage(
              "https://images.pexels.com/photos/220938/pexels-photo-220938.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 0,
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    child: Image(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.7,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/bg.png'),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                    topLeft: Radius.circular(40.0),
                  ))),
        ),
        Positioned(bottom: 0, child: AnimalList()),
      ],
    );
  }
}
