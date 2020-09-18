import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: kInactiveSliderColour,
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
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
                  child: Card(
                    title: 'WEIGHT',
                    onPressedMinus: () {
                      setState(() {
                        if (weight > 5) {
                          --weight;
                        }
                      });
                    },
                    onPressedPlus: () {
                      setState(() {
                        if (weight < 200) {
                          ++weight;
                        }
                      });
                    },
                    getNumberText: () {
                      return weight.toString();
                    },
                  ),
                ),
                Expanded(
                  child: Card(
                    title: 'AGE',
                    onPressedMinus: () {
                      setState(() {
                        if (age > 1) {
                          --age;
                        }
                      });
                    },
                    onPressedPlus: () {
                      setState(() {
                        if (age < 150) {
                          ++age;
                        }
                      });
                    },
                    getNumberText: () {
                      return age.toString();
                    },
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultsPage();
                  },
                ),
              );
            },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: kLargeButtonTextStyle,
                ),
              ),
              color: kBottomContainerColour,
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(bottom: 20.0),
              width: double.infinity,
              height: kBottomContainerHeight,
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: this.onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

class Card extends StatelessWidget {
  Card({
    @required this.title,
    @required this.onPressedMinus,
    @required this.onPressedPlus,
    @required this.getNumberText,
  });

  final String title;
  final Function onPressedMinus;
  final Function onPressedPlus;
  final Function getNumberText;

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      colour: kActiveCardColour,
      cardChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: kLabelTextStyle,
          ),
          Text(
            getNumberText(),
            style: kNumberTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundIconButton(
                icon: FontAwesomeIcons.minus,
                onPressed: onPressedMinus,
              ),
              SizedBox(
                width: 10.0,
              ),
              RoundIconButton(
                icon: FontAwesomeIcons.plus,
                onPressed: onPressedPlus,
              ),
            ],
          )
        ],
      ),
    );
  }
}
