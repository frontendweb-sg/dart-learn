class Node<T> {
  Node(this.value);
  T value;

  Node<T>? leftNode;
  Node<T>? rightNode;

  @override
  String toString() {
    // TODO: implement toString
    return 'Node(value:$value,leftNode:$leftNode,rightNode:$rightNode)';
  }
}

Node<E>? createTree<E>(List<E> nodes, {int index = 0}) {
  if (index >= nodes.length) return null;

  final node = Node(nodes[index]);

  int leftNode = 2 * index + 1;
  int rightNode = 2 * index + 2;

  node.leftNode = createTree(nodes, index: leftNode);
  node.rightNode = createTree(nodes, index: rightNode);

  return node;
}
