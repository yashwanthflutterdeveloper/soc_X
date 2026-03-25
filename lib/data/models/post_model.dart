class Post {
  final int id;
  final String title;
  final String body;

  int likes;          // 🔥 mutable
  int dislikes;
  int commentsCount;  // 🔥 mutable

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.likes,
    required this.dislikes,
    required this.commentsCount,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    final reactions =  json["reactions"]?? {};
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      // ✅ SAFE EXTRACTION
      likes: reactions is Map ? reactions['likes'] ?? 0 : 0,
      dislikes: reactions is Map ? reactions['dislikes'] ?? 0 : 0,

      // DummyJSON does not give count directly
      commentsCount: 0,
    );
  }
}
