import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;
  double bmi = 0;

  CalculatorBrain({required this.height, required this.weight});

  String calcBMI() {
    bmi = weight / pow(height / 100, 2);

    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi >= 25) {
      return "Overweight";
    } else if (bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    if (bmi >= 25) {
      return "You have a higher than normal body weight. Try to exercise more.";
    } else if (bmi > 18.5) {
      return "You have a normal body weight. Good job!";
    } else {
      return "You have a lower than normal body weight. You should eat a bit more.";
    }
  }
}