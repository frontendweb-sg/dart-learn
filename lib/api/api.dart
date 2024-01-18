import 'dart:convert';
import 'dart:io';

import 'package:dart_learn/api/api_repo.dart';
import 'package:dart_learn/common.dart';

String msg = "press y for api menu, press n for exit, press m for main menu";

class Api {
  late ApiRepoImp apiImp;
  Api() {
    apiImp = ApiRepoImp();
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
        await apiImp.getTodos();
        more(action, msg);
      case 2:
        int id = int.parse(inputMessage('Enter record id'));
        await apiImp.getTodoById(id);
        more(action, msg);
      case 3:
        Map<String, dynamic> body =
            json.decode(inputMessage('Enter record in json fromat for save'));
        await apiImp.addTodo(body);
        more(action, msg);
      case 4:
        int id =
            int.parse(inputMessage("Enter record id which you want to delete"));
        await apiImp.deleteTodo(id);
        more(action, msg);
      default:
        exit(0);
    }
  }
}
