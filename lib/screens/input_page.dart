import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/re_card.dart';
import 'package:bmi_calculator/components/top_cards_content.dart';
import 'package:bmi_calculator/constants.dart';
import 'results_page.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender seGender;
  int height1 = 180;
  int weight1 = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Recard(
                  onPress: () {
                    setState(() {
                      seGender = Gender.male;
                    });
                  },
                  colour: seGender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: TopCardsContent(
                    icon: FontAwesomeIcons.mars,
                    insideText: 'MALE',
                  ),
                ),
              ),
              Expanded(
                child: Recard(
                  onPress: () {
                    setState(() {
                      seGender = Gender.female;
                    });
                  },
                  colour: seGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: TopCardsContent(
                    icon: FontAwesomeIcons.venus,
                    insideText: 'FEMALE',
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: Recard(
              colour: kActiveCardColor,
              cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("HEIGHT", style: kLabelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height1.toString(), style: kNumberStyle),
                        Text(
                          "cm",
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTickMarkColor: Color(0xFF8D8E98),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        overlayColor: Color(0x29EB1555),
                        thumbColor: Color(0xFFEB1555),
                      ),
                      child: Slider(
                        value: height1.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            height1 = newValue.round();
                          });
                        },
                        min: 100,
                        max: 320,
                      ),
                    ),
                  ]),
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Recard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("WEIGHT", style: kLabelTextStyle),
                        Text(weight1.toString(), style: kNumberStyle),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                toBe: () {
                                  setState(() {
                                    weight1 -= 1;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                toBe: () {
                                  setState(() {
                                    weight1 += 1;
                                  });
                                },
                              ),
                            ])
                      ]),
                ),
              ),
              Expanded(
                child: Recard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("AGE", style: kLabelTextStyle),
                        Text(age.toString(), style: kNumberStyle),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                toBe: () {
                                  setState(() {
                                    age -= 1;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                toBe: () {
                                  setState(() {
                                    age += 1;
                                  });
                                },
                              ),
                            ])
                      ]),
                ),
              ),
            ],
          )),
          BottomButton(
            buttonTitle: 'Calculate',
            onTap: () {
              CalculatorBrain calci = CalculatorBrain(height: height1, weight: weight1);
              calci.caculateBMI();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultsPage(
                    bmiValue: calci.getBMI(),
                    bmiResult: calci.getResults(),
                    bmiSuggestions: calci.getSuggestions(),
                  )));
            },
          )
        ],
      ),
    );
  }
}
