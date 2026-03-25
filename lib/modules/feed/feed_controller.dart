import 'package:get/get.dart';
import '../../data/models/post_model.dart';
import '../../data/services/api_service.dart';
import 'package:flutter/material.dart';

class FeedController extends GetxController {
  final ApiService api = ApiService();

  var posts = <Post>[].obs;
  var isLoading = false.obs;

  final TextEditingController postController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      isLoading(true);
      posts.value = await api.fetchPosts();
    } finally {
      isLoading(false);
    }
  }

  /// ❤️ LIKE (LOCAL)
  void likePost(Post post) {
    post.likes++;
    posts.refresh();
  }

  /// 📝 ADD POST (TWITTER STYLE)
  Future<void> addPost() async {
    final text = postController.text.trim();
    if (text.isEmpty) return;

    try {
      Get.back(); // close sheet
      isLoading(true);

      final newPost = await api.addPost(
        title: text.length > 30 ? text.substring(0, 30) : text,
        body: text,
      );

      // 🔥 INSERT AT TOP (TWITTER BEHAVIOR)
      posts.insert(0, newPost);
      postController.clear();
    } catch (e) {
      Get.snackbar('Error', 'Failed to post');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {
    postController.dispose();
    super.onClose();
  }
}
