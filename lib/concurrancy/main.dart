import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

///
/// Long running task fall into two category.
/// 1. I/O tasks,
/// 2. Computational intensive tasks.
///
/// input-output, include reading/writing files, accessing database
/// or download content from internet all happen outside the [CPU]
///
/// computational intensive taken inside the [CPU]
/// decrypting data, parsing json, performing a mathmetical calculation.
///
///
/// A [Thread] is a sequence of commands that a coputer executes.
/// Some programming language support multithreading, running multiple thread
/// simultaneously, but other don't
///
/// Dart is a single threaded.
///
///
/// Parallelism:
/// When multiple tasks run at the same time on multiple processor or [CPU] cores.
/// Ex: When a restaurant that has one person taking orders and other clearing tables,
///     That's parallelism.
///
///
/// Concurrency:
/// When multiple tasks run on single [CPU] core.
/// Ex: When a restaurant has a single person whose taking orders and clearing table,
///     That's a concurrency.
///
///
/// Dart isolate:
/// Dart's single thread runs in what it calls an [isolate]
/// Each [isolate] has its own allocated memory.
///
///
///

void main() async {
  final ip = InternetAddress.anyIPv4;
  final socket = await ServerSocket.bind(ip, 3000);

  print('server is runnig on port ${ip.address}:3000');
  socket.listen((Socket event) {
    handleConnection(event);
  });
}

List<Socket> clients = [];
void handleConnection(Socket client) {
  client.listen((
    Uint8List data,
  ) {
    final msg = String.fromCharCodes(data);

    for (final c in clients) {
      c.write('you are $msg join the party!');
    }

    clients.add(client);
    client.write('you are logged in as $msg');
  }, onError: (error) {
    print(error);
    client.close();
  }, onDone: () {
    print('server: client left');
    client.close();
  });
}
