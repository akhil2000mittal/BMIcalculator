import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class TopCardsContent extends StatelessWidget {
TopCardsContent({this.icon,this.insideText});
final String insideText;
final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(height:15.0, ),
        Text(insideText, style: kLabelTextStyle),
      ]
    );
  }
}
