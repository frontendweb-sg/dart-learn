import 'dart:io';

///
/// Linked list:
/// A linked list is a linear data structure that includes a series of connected nodes.
/// Here, each node stores the [data] an the [addresss] of next [node].
///
/// Node has two fields
/// 1. Value
/// 2. Next
///
/// Value hold the value.
/// Next hold the address of the next node, initially it is [null]
///
/// Linked start from [head].

void main() {
  final linkedList = SinglyList();
  linkedList.insert(10).insert(20);

  linkedList.unshift(30);
  linkedList.remove();
  linkedList.remove();
  linkedList.remove();

  print(linkedList);
  linkedList.traversal();
}

///
/// node [Node<T>]
///
class Node<T> {
  Node({required this.value, this.next});
  final T value;

  Node<T>? next;

  @override
  String toString() {
    return '$value->$next';
  }
}

class SinglyList<T> {
  Node<T>? _head;
  int _length = 0;

  // length
  int get length => _length;

  // unshift
  SinglyList unshift(T value) {
    Node<T> node = Node(value: value);
    node.next = this._head;
    this._head = node;
    _length++;
    return this;
  }

  // insert
  SinglyList insert(T value) {
    Node<T> node = Node(value: value);
    if (_head == null) {
      this._head = node;
    } else {
      Node<T> currentNode = this._head!;
      while (currentNode.next != null) {
        currentNode = currentNode.next!;
      }
      currentNode.next = node;
      _length++;
    }
    return this;
  }

  // traversal
  void traversal() {
    if (_length == 0) {
      print('empty');
    } else {
      Node<T>? current = this._head;
      while (current != null) {
        print(current.value);
        current = current.next;
      }
    }
  }

  // remove
  T? remove() {
    if (this._head == null) return null;

    Node<T>? current = this._head; // 30->10->20->null, 10->20->null, 20->null
    while (current!.next!.next != null) {
      current = current.next;
    }
    if (this._head!.next == null) this._head = null;
    current.next = null;
    return current.value;
  }

  @override
  String toString() {
    return 'Node(head:$_head)';
  }
}
