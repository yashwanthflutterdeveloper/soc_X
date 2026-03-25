import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/post_model.dart';
import '../../data/services/api_service.dart';

class SearchclassController extends GetxController {
  final ApiService apiService = ApiService();

  final TextEditingController searchController = TextEditingController();

  var isLoading = false.obs;
  var results = <Post>[].obs;
  var hasSearched = false.obs;

  /// SEARCH POSTS (ON ENTER)
  Future<void> searchPosts() async {
    final query = searchController.text.trim();
    if (query.isEmpty) return;

    try {
      isLoading(true);
      hasSearched(true);

      final posts = await apiService.searchPosts(query);
      results.assignAll(posts);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to search posts',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading(false);
    }
  }

  /// CLEAR SEARCH
  void clearSearch() {
    searchController.clear();
    results.clear();
    hasSearched(false);
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
