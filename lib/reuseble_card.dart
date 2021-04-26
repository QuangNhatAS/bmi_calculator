import 'package:flutter/material.dart';

class ReusebleCard extends StatelessWidget {
  ReusebleCard({@required this.color, this.cardChild, this.press});

  final Color color;
  final Widget cardChild;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: cardChild,
      ),
    );
  }
}
