
import 'dart:math';

class CalculatorBrain{

  CalculatorBrain({this.height,this.weight});

  final int height;
  final int weight;
  double _bmi;

  double caculateBMI(){
    _bmi = (weight/ (pow(height/100, 2)));
    double bmi= _bmi;
    return bmi;
  }


  String getBMI(){
    _bmi = (weight/ (pow(height/100, 2)));
    return _bmi.toStringAsFixed(1);
  }

  String getResults(){
    if(_bmi>25){return 'Overweight';}
    else if (_bmi>18.5){return 'Normal';}
    else{return 'UnderWeight';}
  }

String getSuggestions(){
    if(_bmi>25){return 'Your weight is more than normal, EXERCISE MORE';}
    else if (_bmi>18.5){return 'Your weight is normal, GOOD JOB';}
    else{return 'Your weight is lower than normal, EAT BIT MORE';}
  }
}