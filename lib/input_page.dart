import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constatnts.dart';
import 'result_page.dart';
import 'brain.dart';

const Color inactiveCardColor = Color(0xFF0d102b);
const Color activeCardColor = Color(0xFF1D2033);
const Color knobColor = Color(0xFFEA1556);

int height = 160;
int weight = 64;
int age = 22;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = activeCardColor;
  Color femaleCardColor = inactiveCardColor;

  void toggleMaleFemale(String gender) {
    setState(() {
      if (gender == 'male' && maleCardColor == inactiveCardColor) {
        maleCardColor = activeCardColor;
        femaleCardColor = inactiveCardColor;
      } else if (gender == 'female' && femaleCardColor == inactiveCardColor) {
        femaleCardColor = activeCardColor;
        maleCardColor = inactiveCardColor;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI CALCULATOR',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      toggleMaleFemale('male');
                    },
                    child: ReusableCard(
                      colour: maleCardColor,
                      cardChild: ReusableCardElement(
                        icon: FontAwesomeIcons.mars,
                        gender: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      toggleMaleFemale('female');
                    },
                    child: ReusableCard(
                      colour: femaleCardColor,
                      cardChild: ReusableCardElement(
                        icon: FontAwesomeIcons.venus,
                        gender: 'FEMALE',
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: Color(0xFF1D2033),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: kTextStyle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kNumberStyle,
                            ),
                            Text(
                              'cm',
                              style: kTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Color(0xFFEA1556),
                              thumbColor: Color(0xFFEA1556),
                              thumbShape:
                                  RoundSliderThumbShape(enabledThumbRadius: 15),
                              overlayColor: Color(0x40EA1556),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 27)),
                          child: Slider(
                            value: height.toDouble(),
                            inactiveColor: Color(0xFF4C4E5E),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double value) {
                              setState(() {
                                height = value.round();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: Color(0xFF1D2033),
                    cardChild: ReusableCounter(
                      which: 'weight',
                      val: weight,
                      label: 'weight',
                      subLabel: 'kg',
                      onPressedPlus: () {
                        setState(() {
                          if (weight <= 140) weight++;
                        });
                      },
                      onPressedMinus: () {
                        setState(() {
                          if (weight >= 5) weight--;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: Color(0xFF1D2033),
                    cardChild: ReusableCounter(
                      which: 'age',
                      val: age,
                      label: 'age',
                      subLabel: 'yr',
                      onPressedPlus: () {
                        setState(() {
                          if (age <= 110) age++;
                        });
                      },
                      onPressedMinus: () {
                        setState(() {
                          if (age >= 2) age--;
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Brain brain = Brain(age: age, height: height, weight: weight);

              brain.calcBMI();

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmi: brain.bmi(),
                            hDesc: brain.healthDesc(),
                            hLevel: brain.healthLevel(),
                            hLevelColor: brain.healthLevelColor(),
                          )));
            },
            child: Container(
              child: Center(
                child: Text(
                  'Calculate your bmi'.toUpperCase(),
                  style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w400),
                ),
              ),
              color: Color(0xFFEA1556),
              margin: EdgeInsets.only(top: 5),
              height: 80,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableCounter extends StatelessWidget {
  const ReusableCounter(
      {@required this.which,
      @required this.label,
      @required this.val,
      @required this.onPressedPlus,
      @required this.onPressedMinus,
      @required this.subLabel});

  final String which;
  final String label;
  final int val;
  final String subLabel;
  final Function onPressedPlus;
  final Function onPressedMinus;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            label,
            style: kTextStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Text(
                  val.toString(),
                  style: kNumberStyle,
                ),
                Text(
                  subLabel,
                  style: TextStyle(fontWeight: FontWeight.w200, fontSize: 14),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: onPressedPlus,
                    child: Icon(
                      FontAwesomeIcons.plus,
                      color: Colors.black,
                      size: 40,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50), color: knobColor),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: onPressedMinus,
                      child: Icon(
                        FontAwesomeIcons.minus,
                        color: Colors.black,
                        size: 40,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: knobColor,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ReusableCardElement extends StatelessWidget {
  const ReusableCardElement({@required this.icon, @required this.gender});

  final IconData icon;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 70,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          gender,
          style: kTextStyle,
        )
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild});

  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration:
          BoxDecoration(color: colour, borderRadius: BorderRadius.circular(5)),
      child: cardChild,
    );
  }
}
