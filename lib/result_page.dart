import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'bottom_button.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    super.key,
    required this.bmi,
    required this.interpretation,
    required this.result,
  });

  final String bmi;
  final String result;
  final String interpretation;

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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Center(
              child: Text(
                "Your Result",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              clr: const Color(0xFF1D1E33),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    result.toUpperCase(),
                    style: const TextStyle(
                      color: Color(0xFF24D876),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmi,
                    style: const TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            message: "RE-CALCULATE",
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}