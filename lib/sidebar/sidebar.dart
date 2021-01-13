import 'dart:async';

import 'package:Final/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:Final/sidebar/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'menu_item.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSideBarOpenedSreamcontroller;
  Stream<bool> isSideBaropenedStream;
  StreamSink<bool> isSideBarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    isSideBarOpenedSreamcontroller = PublishSubject<bool>();
    isSideBaropenedStream = isSideBarOpenedSreamcontroller.stream;
    isSideBarOpenedSink = isSideBarOpenedSreamcontroller.sink;
  }

  void dispose() {
    _animationController.dispose();
    isSideBarOpenedSreamcontroller.close();
    isSideBarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSideBarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSideBarOpenedSink.add(true);

      _animationController.forward();
    }
  }

  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    print(width);
    print(width - 0.8 * width);
    return StreamBuilder<bool>(
      initialData: false,
      stream: isSideBaropenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data ? 0 : -width,
          right: isSideBarOpenedAsync.data
              ? width - 0.8 * width
              : width - width / 6.9,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      SafeArea(
                        child: Center(
                          child: 
                            
                             Row(
                              children:[ Column(
                                children: [
                                  Text(
                                    "Pet's",
                                    style: TextStyle(
                                        color: Color(0xFFBA2D65),
                                        fontSize: 45,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "            Point",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 45,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),/*SizedBox(width: 10,)*/],
                            ),
                          ),
                        ),
                      
                      Divider(
                        height: 64,
                        thickness: 0.5,
                        color: Colors.white,
                        indent: 32,
                        endIndent: 32,
                      ),
                      MenuItem(
                        height: MediaQuery.of(context).size.height -
                            height / 15 -
                            kToolbarHeight,
                        width: MediaQuery.of(context).size.width * 0.8,
                        title: 'adopt',
                        color: Color(0xFFBA2D65),
                        func: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.AdoptClickedEvent);
                        },
                      ),
                      MenuItem(
                        height: MediaQuery.of(context).size.height -
                            height / 15 -
                            kToolbarHeight,
                        width: MediaQuery.of(context).size.width * 0.8,
                        title: 'donate',
                        color: Colors.white,
                        func: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.RescuersClickedEvent);
                        },
                      ),
                      MenuItem(
                        height: MediaQuery.of(context).size.height -
                            height / 15 -
                            kToolbarHeight,
                        width: MediaQuery.of(context).size.width * 0.8,
                        title: 'breeds',
                        color: Color(0xFFBA2D65),
                        func: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.BreedsClickedEvent);
                        },
                      ),
                      MenuItem(
                        height: MediaQuery.of(context).size.height -
                            height / 15 -
                            kToolbarHeight,
                        width: MediaQuery.of(context).size.width * 0.8,
                        title: 'request',
                        color: Colors.white,
                        func: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.DonateClickedEvent);
                        },
                      ),
                      MenuItem(
                        height: MediaQuery.of(context).size.height -
                            height / 15 -
                            kToolbarHeight,
                        width: MediaQuery.of(context).size.width * 0.8,
                        title: 'maps',
                        color: Color(0xFFBA2D65),
                        func: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.HelpClickedEvent);
                        },
                      ),
                      MenuItem(
                        height: MediaQuery.of(context).size.height -
                            height / 15 -
                            kToolbarHeight,
                        width: MediaQuery.of(context).size.width * 0.8,
                        title: 'put up',
                        color: Colors.white,
                        func: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.AboutUsClickedEvent);
                        },
                      ),
                    ],
                  ),
                  color: Color(0xFFF48FB1),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.8),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: width / 6.9,
                      height: height / 6.4,
                      color: Color(0xFFF48FB1),
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                          icon: AnimatedIcons.menu_close,
                          progress: _animationController.view,
                          color: Colors.white,
                          size: width / 6.9 - 15),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;
    Path path = Path();
    final width = size.width;
    final height = size.height;
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
