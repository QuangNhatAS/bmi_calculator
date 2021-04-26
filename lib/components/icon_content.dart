import '../constants.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent({
    this.cardText,
    this.cardIcon,
  });

  final String cardText;
  final IconData cardIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: 60,
        ),
        SizedBox(height: 10.0),
        Text(
          cardText,
          style: kTextStyle,
        )
      ],
    );
  }
}