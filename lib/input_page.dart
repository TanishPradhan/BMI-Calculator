import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_container.dart';
import 'constraints.dart';
import 'result_page.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';

enum gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  gender genderSelected;

  int height = 180;
  int weight = 70;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              // updateColour(gender.male);
                              genderSelected = gender.male;
                            });
                          },
                          child: ReusableCard(
                            colour: genderSelected == gender.male
                                ? activeCardColour
                                : inactiveCardColour,
                            cardChild: IconContainer(
                              icon: FontAwesomeIcons.mars,
                              text: 'MALE',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              genderSelected = gender.female;
                            });
                          },
                          child: ReusableCard(
                            colour: genderSelected == gender.female
                                ? activeCardColour
                                : inactiveCardColour,
                            cardChild: IconContainer(
                              icon: FontAwesomeIcons.venus,
                              text: 'FEMALE',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: labelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: numberTextStyle2,
                            ),
                            Text(
                              'cm',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Color(0xFF8D8E98),
                              ),
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: bottomCardColour,
                            overlayColor: Color(0x29EB1555),
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xFF8D8E98),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 12.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 22.0),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ReusableCard(
                          colour: activeCardColour,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'WEIGHT',
                                style: labelTextStyle,
                              ),
                              Text(
                                weight.toString(),
                                style: numberTextStyle2,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  FloatingActionButton(
                                    backgroundColor: Color(0xFF4C4F5E),
                                    foregroundColor: Colors.white,
                                    child: Icon(
                                      FontAwesomeIcons.minus,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  FloatingActionButton(
                                    backgroundColor: Color(0xFF4C4F5E),
                                    foregroundColor: Colors.white,
                                    child: Icon(
                                      FontAwesomeIcons.plus,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: ReusableCard(
                          colour: activeCardColour,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'AGE',
                                style: labelTextStyle,
                              ),
                              Text(
                                age.toString(),
                                style: numberTextStyle2,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  FloatingActionButton(
                                    backgroundColor: Color(0xFF4C4F5E),
                                    foregroundColor: Colors.white,
                                    child: Icon(
                                      FontAwesomeIcons.minus,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  FloatingActionButton(
                                    backgroundColor: Color(0xFF4C4F5E),
                                    foregroundColor: Colors.white,
                                    child: Icon(
                                      FontAwesomeIcons.plus,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                BottomButton(
                  onTap: () {
                    CalculatorBrain calc =
                        CalculatorBrain(height: height, weight: weight);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultPage(
                                  bmiScore: calc.bmiCalculator(),
                                  resultText: calc.getResult(),
                                  interpretation: calc.getInterpretation(),
                                )));
                  },
                  titleText: 'CALCULATE',
                ),
              ]),
        ));
  }
}
