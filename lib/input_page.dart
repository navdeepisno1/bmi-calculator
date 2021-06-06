import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'my_widgets.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bmi_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  kGenderType genderType;
  int height = 180;
  int weight = 60;
  int age = 20;

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
                      cardOnClick: () {
                        setState(() {
                          genderType = kGenderType.male;
                        });
                      },
                      cardColor: genderType == kGenderType.male
                          ? kActiveCardColor
                          : kInActiveCardColor,
                      cardChild: GenderWidget(
                        genderText: 'Male',
                        genderIcon: FontAwesomeIcons.mars,
                      )),
                ),
                Expanded(
                  child: ReusableCard(
                      cardOnClick: () {
                        setState(() {
                          genderType = kGenderType.female;
                        });
                      },
                      cardColor: genderType == kGenderType.female
                          ? kActiveCardColor
                          : kInActiveCardColor,
                      cardChild: GenderWidget(
                        genderText: 'Female',
                        genderIcon: FontAwesomeIcons.venus,
                      )),
                ),
              ],
            )),
            Expanded(
              child: ReusableCard(
                  cardColor: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text('$height', style: kLabelTextStyleBold),
                          Text('cm', style: kLabelTextStyle)
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFF8D8E98),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          onChanged: (double newHeight) {
                            setState(() {
                              height = newHeight.toInt();
                            });
                          },
                          min: 120,
                          max: 220,
                        ),
                      )
                    ],
                  )),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      cardColor: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            '$weight',
                            style: kLabelTextStyleBold,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    if (weight >= 0) weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    if (weight >= 0) weight++;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      )),
                ),
                Expanded(
                  child: ReusableCard(
                      cardColor: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            '$age',
                            style: kLabelTextStyleBold,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    if (age >= 0) age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    if (age >= 0) age++;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      )),
                ),
              ],
            )),
            GestureDetector(
              onTap: ()
              {
                BmiBrain brain = BmiBrain(height: height,weight: weight);
                final String bmi = brain.calculateBMI();
                final String result = brain.getResult();
                final String interpretation = brain.getInterpretation();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultsPage(
                  bmi: bmi, result: result, interpretation: interpretation,
                )));
              },
              child: Container(
                margin: EdgeInsets.only(top: 16),
                width: double.infinity,
                color: kBottomContainerColor,
                height: kBottomContainerHeight,
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
