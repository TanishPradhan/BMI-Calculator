import 'package:flutter/material.dart';
import 'constraints.dart';

class IconContainer extends StatelessWidget {
  IconContainer({
    @required this.icon,
    @required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          text,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
