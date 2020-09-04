import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final Color color;
  final Function func;
  final double width;
  final double height;

  const MenuItem(
      {Key key, this.title, this.color, this.func, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        width: width,
        height: height /9 ,
        padding: EdgeInsets.only(left: 30),
        alignment: Alignment.centerLeft,
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            title,
            style: TextStyle(color: color, fontSize: 50, letterSpacing: 2),
          ),
        ),
      ),
    );
  }
}
