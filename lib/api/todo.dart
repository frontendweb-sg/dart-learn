class Todo {
  final int id;
  final String title;
  final String body;
  final int userId;

  Todo(
      {required this.id,
      required this.body,
      required this.title,
      required this.userId});

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json['id'],
        body: json['body'],
        title: json['title'],
        userId: json['userId'],
      );

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "id": id,
      "body": body,
      "userId": userId,
    };
  }
}
