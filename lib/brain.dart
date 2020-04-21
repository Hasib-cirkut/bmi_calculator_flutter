import 'dart:math';

import 'package:flutter/material.dart';

class Brain {
  Brain({this.height, this.age, this.weight});

  final int height;
  final int age;
  final int weight;

  double _bmi;
  String hLevel;
  String hDesc;

  Color colour;

  void calcBMI() {
    _bmi = (weight / pow(height / 100, 2));
  }

  String bmi() {
    return _bmi.toStringAsFixed(1);
  }

  String healthLevel() {
    if (_bmi < 18.5) {
      hLevel = 'Thinness';
    } else if (_bmi >= 18.5 && _bmi <= 25) {
      hLevel = 'Normal';
    } else {
      hLevel = 'overweight';
    }

    return hLevel;
  }

  String healthDesc() {
    if (_bmi < 18.5) {
      hDesc = 'You are underweight. Try to eat more protien';
    } else if (_bmi >= 18.5 && _bmi <= 25) {
      hDesc = 'You have a healthy body weight. Good job';
    } else {
      hDesc = 'You are overweight. Please do more exercise';
    }

    return hDesc;
  }

  Color healthLevelColor() {
    if (_bmi < 18.5) {
      colour = Colors.yellow;
    } else if (_bmi >= 18.5 && _bmi <= 25) {
      colour = Colors.greenAccent;
    } else {
      colour = Colors.red;
    }

    return colour;
  }
}
