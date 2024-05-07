import 'package:bmi_calculator/result_page.dart';
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bottom_button.dart';
import 'reusable_card.dart';
import 'content_widget.dart';
import 'round_button.dart';
import 'calculator_brain.dart';

const bottomContainerHeight = 50.0;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

enum Gender { male, female }

enum Operation { plus, minus }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _State();
}

class _State extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;
  int height = 180;
  int weight = 55;
  int age = 20;

  void updateColor(Gender gender) {
    if (gender == Gender.male) {
      if (maleCardColor == activeCardColor) {
        maleCardColor = inactiveCardColor;
      } else {
        maleCardColor = activeCardColor;
        femaleCardColor = inactiveCardColor;
      }
    }
    if (gender == Gender.female) {
      if (femaleCardColor == activeCardColor) {
        femaleCardColor = inactiveCardColor;
      } else {
        femaleCardColor = activeCardColor;
        maleCardColor = inactiveCardColor;
      }
    }
  }

  void changeWeight(Operation operation) {
    setState(
          () {
        if (operation == Operation.plus) {
          weight = weight + 1;
        }
        if (operation == Operation.minus) {
          weight = weight - 1;
        }
      },
    );
  }

  void changeAge(Operation operation) {
    setState(
          () {
        if (operation == Operation.plus) {
          age = age + 1;
        }
        if (operation == Operation.minus) {
          age = age - 1;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Container(
            color: Colors.black45,
            height: 1,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(
                              () {
                            updateColor(Gender.male);
                          },
                        );
                      },
                      child: ReusableCard(
                        clr: maleCardColor,
                        cardChild: const ContentWidget(
                          iconData: FontAwesomeIcons.mars,
                          gender: "MALE",
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(
                              () {
                            updateColor(Gender.female);
                          },
                        );
                      },
                      child: ReusableCard(
                        clr: femaleCardColor,
                        cardChild: const ContentWidget(
                          iconData: FontAwesomeIcons.venus,
                          gender: "FEMALE",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Expanded(
              child: ReusableCard(
                clr: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "HEIGHT",
                      style: TextStyle(
                        color: Color(0xFF8D8E98),
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const Text(
                          "cm",
                          style: TextStyle(
                            color: Color(0xFF8D8E98),
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 12,
                        ),
                        overlayShape: const RoundSliderOverlayShape(
                          overlayRadius: 24,
                        ),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        onChanged: (double newValue) {
                          setState(
                                () {
                              height = newValue.round();
                            },
                          );
                        },
                        min: 120,
                        max: 220,
                        activeColor: const Color(0xFFEB1555),
                        inactiveColor: const Color(0xFF8D8E98),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Expanded(
                    child: ReusableCard(
                      clr: activeCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "WEIGHT",
                            style: TextStyle(
                              color: Color(0xFF8D8E98),
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            weight.toString(),
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  changeWeight(Operation.minus);
                                },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  changeWeight(Operation.plus);
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Expanded(
                    child: ReusableCard(
                      clr: activeCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "AGE",
                            style: TextStyle(
                              color: Color(0xFF8D8E98),
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            age.toString(),
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  changeAge(Operation.minus);
                                },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  changeAge(Operation.plus);
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            message: "CALCULATE",
            onTap: () {
              CalculatorBrain calc =
              CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultPage(
                      bmi: calc.calcBMI(),
                      result: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}