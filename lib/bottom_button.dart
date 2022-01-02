import 'package:flutter/material.dart';
import 'constraints.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.titleText});

  final Function onTap;
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        color: bottomCardColour,
        width: double.infinity,
        margin: EdgeInsets.only(top: 15),
        height: bottomContainerHeight,
        child: Text(
          titleText,
          style: calculateTextStyle,
        ),
      ),
    );
  }
}
