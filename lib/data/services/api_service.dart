import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

import '../models/comment_model.dart';
import '../models/post_model.dart';

class ApiService {
  static const _baseUrl = 'https://dummyjson.com';

  Future<List<Post>> fetchPosts() async {
    final res = await http.get(Uri.parse('$_baseUrl/posts'));
    final data = json.decode(res.body);
    return (data['posts'] as List)
        .map((e) => Post.fromJson(e))
        .toList();
  }

  Future<List<Comment>> fetchComments(int postId) async {
    final res = await http.get(
      Uri.parse('$_baseUrl/posts/$postId/comments'),
    );
    final data = json.decode(res.body);
    return (data['comments'] as List)
        .map((e) => Comment.fromJson(e))
        .toList();
  }

  Future<List<Post>> searchPosts(String query) async {
    final res = await http.get(
      Uri.parse('https://dummyjson.com/posts/search?q=$query'),
    );

    if (res.statusCode == 200) {
      final data = json.decode(res.body);
      return (data['posts'] as List)
          .map((e) => Post.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to search posts');
    }
  }

// api_service.dart
  Future<List<Post>> fetchPostsByUser(int userId) async {
    final res =
    await http.get(Uri.parse('$_baseUrl/posts/user/$userId'));

    if (res.statusCode == 200) {
      final data = json.decode(res.body);
      return (data['posts'] as List)
          .map((e) => Post.fromJson(e))
          .toList();
    }
    throw Exception('Failed to load user posts');
  }

  Future addPost({required String title, required String body}) async {}


}