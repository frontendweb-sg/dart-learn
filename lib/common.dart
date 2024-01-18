import 'dart:io';

import 'package:dart_learn/api/api.dart';
import 'package:dart_learn/calculator/calculator_repo.dart';

void more(Function cb, [String msg = "continue press y/yes stop press n..."]) {
  print(msg);
  String more = stdin.readLineSync()!;
  if (more == 'y' || more == 'Y' || more == 'Yes' || more == 'yes') {
    cb();
  }
  if (more == 'menu' || more == "m") {
    globalAction();
  } else {
    exit(0);
  }
}

String inputMessage(String msg) {
  print(msg);
  return stdin.readLineSync()!;
}

void globalAction() async {
  print('Operations');
  print('1 for calculator');
  print('2 for api');
  int input = int.parse(stdin.readLineSync()!);
  switch (input) {
    case 1:
      calc();
      more(globalAction);
    case 2:
      await Api().action();
      more(globalAction);
    default:
      exit(0);
  }
}
