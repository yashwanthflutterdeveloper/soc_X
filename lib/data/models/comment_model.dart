class Comment {
  final int id;
  final int postId;
  final String body;
  final String username;

  Comment({
    required this.id,
    required this.postId,
    required this.body,
    required this.username,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      postId: json['postId'],
      body: json['body'],
      username: json['user']['username'],
    );
  }
}
