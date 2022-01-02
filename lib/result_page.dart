import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/constraints.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.bmiScore,
      @required this.resultText,
      @required this.interpretation});

  final String bmiScore;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Container(
              alignment: Alignment.center,
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
            Expanded(
                flex: 7,
                child: ReusableCard(
                  colour: activeCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        resultText.toUpperCase(),
                        style: resultTextStyle,
                      ),
                      Text(
                        bmiScore,
                        style: resultBMITextStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          interpretation,
                          textAlign: TextAlign.center,
                          style: resultBodyTextStyle,
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
                child: BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              titleText: 'RE-CALCULATE',
            )),
          ],
        ));
  }
}
