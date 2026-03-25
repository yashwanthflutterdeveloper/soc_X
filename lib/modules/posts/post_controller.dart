import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../data/models/comment_model.dart';
import '../../data/models/post_model.dart';
import '../../data/services/api_service.dart';

class PostDetailController extends GetxController {
  final api = ApiService();

  late Post post;

  var comments = <Comment>[].obs;
  var isLoading = true.obs;

  final TextEditingController commentController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    post = Get.arguments as Post;
    fetchComments();
  }

  void fetchComments() async {
    try {
      isLoading(true);
      comments.value = await api.fetchComments(post.id);
      post.commentsCount = comments.length;
    } finally {
      isLoading(false);
    }
  }

  /// 🔥 ADD COMMENT (LOCAL)
  void addComment() {
    final text = commentController.text.trim();
    if (text.isEmpty) return;

    final newComment = Comment(
      id: DateTime.now().millisecondsSinceEpoch,
      postId: post.id,
      body: text,
      username: 'you', // mock user
    );

    comments.insert(0, newComment);
    post.commentsCount++;

    commentController.clear();
    comments.refresh();
  }
}



