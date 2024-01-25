///
/// Callable class
/// To allow an instance of your Dart class to be called like a function, to implement [call()]

void main() {
  final st = Student();
  print(st('Pradeep'));
}

class Student {
  call(String name) {
    print("I am callable class $name");
  }
}
