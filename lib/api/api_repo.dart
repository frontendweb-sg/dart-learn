import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

abstract class _ApiRepo<T> {
  Future<List<T>> getTodos([int limit = 2]);
  Future<T> getTodoById(int id);
  Future<T> addTodo(T todo);
  Future<T> updateTodo(T todo);
  Future<T> deleteTodo(int id);
}

class ApiRepoImp<T> implements _ApiRepo<T> {
  late final String _url;
  ApiRepoImp([String httpurl = 'http://localhost:3001/posts']) : _url = httpurl;

  @override
  Future<T> addTodo(T body) async {
    try {
      print('todo $body');
      final response = await http.post(
        Uri.parse(_url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );
      T data = json.decode(response.body);
      print('DATA SAVED SUCCESSFULLY');
      print(_toJson(data));
      return data;
    } on HttpException catch (error) {
      print(error.message);
      throw Exception(error);
    }
  }

  @override
  Future<T> deleteTodo(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('$_url/$id'),
        headers: {"Content-Type": "application/json"},
      );
      T data = json.decode(response.body);
      print('DATA DELETED SUCCESSFULLY');
      return data;
    } on HttpException catch (error) {
      print(error.message);
      throw Exception(error);
    }
  }

  @override
  Future<T> getTodoById(int id) async {
    try {
      print('$_url/$id');
      final response = await http.get(Uri.parse('$_url/$id'));
      final T data = json.decode(response.body);
      print('data $data');
      print(_toJson(data));
      return data;
    } on HttpException catch (error) {
      print(error.message);
      throw Exception(error);
    }
  }

  @override
  Future<T> updateTodo(T todo) async {
    try {
      if (todo == null && (todo as Map)['id'] == null) return null as T;
      final response = await http.delete(
        Uri.parse('$_url/${(todo as Map)['id']}'),
        headers: {"Content-Type": "application/json"},
        body: todo,
      );
      T data = json.decode(response.body);
      print('DATA DELETED SUCCESSFULLY');
      print(_toJson(data));
      return data;
    } on HttpException catch (error) {
      print(error.message);
      throw Exception(error);
    }
  }

  @override
  Future<List<T>> getTodos([int limit = 2]) async {
    try {
      final response = await http.get(Uri.parse(_url));
      final List<T> data = json.decode(response.body);
      print(data.sublist(0, limit).map((e) => _toJson(e)));
      return data.sublist(0, limit);
    } on HttpException catch (error) {
      print(error.message);
      throw Exception(error);
    }
  }
}

String _toJson(payload) {
  final indent = JsonEncoder.withIndent('    ');
  return indent.convert(payload);
}
