///
/// What is stack?
/// Stack is a linear data structure that follow the concepts of [Last-in-first-out] or [First-in-last-out].
///
/// Ex:
/// 1. Plates
/// 2. books
///
///

void main() {
  // final stack = Stack();
  // print(stack);
  // print(stack.length);
  // print(stack.empty);
  // print(stack.peek());
  // stack.push(10).push(20).push(30).push(40);
  // print(stack);
  // print(stack.length);
  // print(stack.empty);
  // stack.pop();
  // print(stack.peek());
  print(balanceParenthesis('(a+b)*({}c-d)'));
}

class Stack<T> {
  Stack() : _storage = [];
  final List<T> _storage;

  // push
  Stack push(T item) {
    _storage.add(item);
    return this;
  }

  Stack.of(Iterable<T> elements) : _storage = List<T>.of(elements);

  // pop
  T pop() => _storage.removeLast();

  // peek
  T? peek() {
    if (_storage.isEmpty) return null;
    return _storage.last;
  }

  // empty
  bool get empty => _storage.isEmpty;

  // lengh
  int get length => _storage.length;

  @override
  String toString() {
    return 'Stack(storage:$_storage)';
  }
}

///
/// Write a program to check if a given expression has balanced prentheses.
/// ex: (a+b)*(c-d)- true, (a+b)*((c+d) - false
///

bool balanceParenthesis(String str) {
  print('str $str');
  final stack = Stack();
  Map<String, String> match = {'(': ')', '[': ']', '{': '}'};
  for (int i = 0; i < str.length; i++) {
    if (match.keys.contains(str[i])) {
      stack.push(str[i]);
    } else if (match.values.contains(str[i])) {
      if (stack.empty || match[stack.pop()] != str[i]) {
        return false;
      }
    }
  }

  print('hi');
  print(stack);
  return stack.empty;
}
