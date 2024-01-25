void main() async {
  await for (int value in getNumbers()) {
    print(value);
  }
}

Stream<int> getNumbers() async* {
  for (int i = 0; i <= 10; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}
