// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dart_learn/callable/main.dart';

void main() {
  final p = Person(id: 1, name: 'Pradeep', age: 20);
  final p1 = Person(id: 2, name: 'Arun', age: 21);
  final p3 = p;

  print(p.hashCode);
  print(p3.hashCode);
  print(p1.hashCode);
  print(p == p3);
}

class Person {
  const Person({required this.id, required this.name, required this.age});

  final int id;
  final String name;
  final int age;

  @override
  String toString() {
    return 'Person(id:$id,name:$name,age:$age)';
  }
}
