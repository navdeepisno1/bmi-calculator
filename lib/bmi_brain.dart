import 'dart:math';

class BmiBrain {
  final int height;
  final int weight;

  double _bmi;

  BmiBrain({this.height, this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) return 'Overweight';
    else if (_bmi > 18.5) return 'Normal';
    else return 'Underweight';
  }

  String getInterpretation() {
    if (_bmi >= 25) return 'You have a higher than a normal body weight. Try to exercise more';
    else if (_bmi > 18.5) return 'You are absolutely fine,Keep it up..!!';
    else return 'Try to gain some weight.Don\'t you think it will add to your personality';
  }
}