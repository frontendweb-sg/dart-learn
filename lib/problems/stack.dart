class Stack<T> {
  Stack() : _stack = [];
  final List<T> _stack;

  bool get isEmpty => _stack.isEmpty;
  int get length => _stack.length;

  T peak() => _stack.last;

  Stack push(T value) {
    _stack.add(value);
    return this;
  }

  T pop() {
    return _stack.removeLast();
  }

  @override
  String toString() {
    return 'Stack(stack:$_stack)';
  }
}
