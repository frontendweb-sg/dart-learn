final result = Future.delayed(Duration(seconds: 5), () => 45);

void main() async {
  print('waiting for the result'); // first print
  // final v = await result;
  result
      .then((v) => print(v))
      .catchError((error) => print(error))
      .whenComplete(() => print('do something'));

  print('value printed'); // final print
}
