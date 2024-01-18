import 'dart:convert';
import 'dart:io';

import 'package:dart_learn/api/api_repo.dart';

class Api {
  late ApiRepoImp apiImp;
  Api() {
    apiImp = ApiRepoImp();
    action();
  }

  action() async {
    print('Network application');
    print('1 for get all records');
    print('2 for get record by id');
    print('3 for get add new record');
    print('4 for get delete record');
    int input = int.parse(stdin.readLineSync()!);
    switch (input) {
      case 1:
        print('1');
        await apiImp.getTodos();
        more();
      case 2:
        int id = int.parse(inputMessage('Enter record id'));
        await apiImp.getTodoById(id);
        more();
      case 3:
        int body =
            json.decode(inputMessage('Enter record in json fromat for save'));
        await apiImp.addTodo(body);
        more();
      case 4:
        int id =
            int.parse(inputMessage("Enter record id which you want to delete"));
        await apiImp.deleteTodo(id);
        more();
      default:
        exit(0);
    }
  }

  more() {
    print("continue press y, stop press n...");
    String more = stdin.readLineSync()!;
    if (more == 'y' || more == 'Y' || more == 'Yes' || more == 'yes') {
      action();
    } else {
      exit(0);
    }
  }

  String inputMessage(String msg) {
    print(msg);
    return stdin.readLineSync()!;
  }
}
