import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './icon_content.dart';
import './reuseble_card.dart';
import './constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {
  male,
  female,
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
          title: Center(child: Text("BMI CALCULATOR")),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusebleCard(
                    color: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    cardChild: IconContent(
                      cardIcon: FontAwesomeIcons.mars,
                      cardText: "MALE",
                    ),
                    press: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusebleCard(
                    color: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    cardChild: IconContent(
                      cardIcon: FontAwesomeIcons.venus,
                      cardText: "FEMALE",
                    ),
                    press: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            )),
            Expanded(
              child: ReusebleCard(
                color: kActiveCardColor,
                cardChild: Column(
                  children: [
                    Text(
                      "HEIGHT",
                      style: kTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: kTextNumberStyle),
                        Text(
                          "cm",
                          style: kTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0xFF8D8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: kContainerColorBottom,
                          overlayColor: kContainerColorBottom.withOpacity(0.15),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 12.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 24.0),
                          trackHeight: 2.0),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.toInt();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusebleCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: kTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kTextNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              press: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              press: () {
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
                  child: ReusebleCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kTextNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              press: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              press: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/result');
              },
              child: Container(
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: kContainerHeightBottom,
                decoration: BoxDecoration(
                    color: kContainerColorBottom,
                    borderRadius: BorderRadius.circular(15.0)),
                child: Center(
                    child: Text(
                  "CAL",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                )),
              ),
            )
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({@required this.icon, @required this.press});
  final IconData icon;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 0.0,
      onPressed: press,
      constraints: BoxConstraints.tightFor(width: 50.0, height: 50.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
