import 'dart:io';

import 'package:dart_learn/common.dart';

abstract class ICalculator {
  void sum();
  void sub();
  void mul();
  void div();
  void sqrt();
  void power();
}

class Calculator extends ICalculator {
  final int x;
  final int y;
  Calculator({required this.x, required this.y});
  @override
  void div() {
    print('result -> ${x / y}');
  }

  @override
  void mul() {
    print('result -> ${x * y}');
  }

  @override
  void power() {
    print('result -> ${x + y}');
  }

  @override
  void sqrt() {
    print('result -> ${x + y}');
  }

  @override
  void sub() {
    print('result -> ${x - y}');
  }

  @override
  void sum() {
    print('result -> ${x + y}');
  }

  @override
  String toString() {
    return '{x:$x,y:$y}';
  }
}

String msg =
    "press y for calculator menu, press n for exit, press m for main menu";
void calc() {
  print("Enter first number");
  int x = int.parse(stdin.readLineSync()!);
  print("Enter first number");
  int y = int.parse(stdin.readLineSync()!);
  final calculator = Calculator(x: x, y: y);
  print("enter operator (+,-,*,/)");
  String op = stdin.readLineSync()!;
  switch (op) {
    case '+':
      calculator.sum();
      more(calc, msg);
    case '-':
      calculator.sub();
      more(calc, msg);
    case '*':
      calculator.mul();
      more(calc, msg);
    case '/':
      calculator.div();
      more(calc, msg);
    default:
      exit(0);
  }
}
