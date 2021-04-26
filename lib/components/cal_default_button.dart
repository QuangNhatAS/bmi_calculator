import 'package:flutter/material.dart';

import '../constants.dart';

class CalDefaultButton extends StatelessWidget {
  const CalDefaultButton({
    Key key,
    @required this.press,
    @required this.text,
  }) : super(key: key);

  final Function press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kContainerHeightBottom,
        decoration: BoxDecoration(
            color: kContainerColorBottom,
            borderRadius: BorderRadius.circular(15.0)),
        child: Center(
            child: Text(
          text,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
        )),
      ),
    );
  }
}