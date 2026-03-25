import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../modules/feed/feed_controller.dart';

class CreatePostSheet extends GetView<FeedController> {
  const CreatePostSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// HEADER
            Row(
              children: [
                const Text(
                  'Create Post',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Get.back(),
                ),
              ],
            ),

            const SizedBox(height: 12),

            /// TITLE FIELD
            TextField(
              controller: controller.titleController,
              maxLength: 60,
              decoration: const InputDecoration(
                labelText: 'Title',
                hintText: 'Give your post a title',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            /// BODY FIELD
            TextField(
              controller: controller.postController,
              maxLines: 5,
              maxLength: 280,
              decoration: const InputDecoration(
                labelText: 'Post',
                hintText: "What's happening?",
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            /// ACTIONS
            Row(
              children: [
                const Icon(Icons.public, size: 18, color: Colors.grey),
                const SizedBox(width: 6),
                const Text(
                  'Public',
                  style: TextStyle(color: Colors.grey),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: controller.addPost,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    'Post',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
