import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:soc_x/modules/posts/post_controller.dart';

import '../../widgets/CommentCard.dart';

class PostDetailView extends GetView<PostDetailController> {
  const PostDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final post = controller.post;

    return Scaffold(
      appBar: AppBar(title: const Text('Post')),

      body: Column(
        children: [
          /// POST CONTENT
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              post.body,
              style: const TextStyle(fontSize: 16),
            ),
          ),

          /// LIKE & COMMENT COUNT
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Icon(Icons.favorite, color: Colors.red),
                const SizedBox(width: 4),
                Text(post.likes.toString()),
                const SizedBox(width: 16),
                const Icon(Icons.comment),
                const SizedBox(width: 4),
                Obx(() => Text(controller.comments.length.toString())),
              ],
            ),
          ),

          const Divider(),

          /// COMMENTS LIST
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                itemCount: controller.comments.length,
                itemBuilder: (_, i) {
                  final c = controller.comments[i];
                  return ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.person)),
                    title: Text(c.username),
                    subtitle: Text(c.body),
                  );
                },
              );
            }),
          ),
        ],
      ),

      /// 🔥 ADD COMMENT BAR
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 5),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller.commentController,
                  decoration: InputDecoration(
                    hintText: 'Add a comment...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.send, color: Colors.blue),
                onPressed: controller.addComment,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
