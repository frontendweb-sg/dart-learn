import 'dart:isolate';

///
/// Isolate:
///
void main() async {
  print('hello world');
  final rp = ReceivePort();
  final sm = await Isolate.spawn<SendPort>(
    sum,
    rp.sendPort,
  );

  rp.listen((message) {
    if (message == null) {
      sm.kill();
      rp.close();
    }
    print(message);
  });
}

void sum(SendPort port) {
  int mums = 1000000000;
  int result = 0;
  for (int i = 0; i < mums; i++) {
    result += i;
  }
  port.send(result);
  // return result;
  Isolate.exit(port, result);
}
