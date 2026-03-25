import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/routes/app_routes.dart';
import '../../widgets/create_post_sheet.dart';
import '../../widgets/post_card.dart';
import 'feed_controller.dart';

class FeedView extends GetView<FeedController> {
  const FeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Scaffold(
        appBar: AppBar(title: const Text('SoC_X')),
      
        body: Obx(() {
          if (controller.isLoading.value && controller.posts.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
      
          return ListView.builder(
            itemCount: controller.posts.length,
            itemBuilder: (_, i) {
              final post = controller.posts[i];
      
              return PostCard(
                post: post,
                onLike: () => controller.likePost(post),
                onTap: () {
                  Get.toNamed(
                    Routes.postDetail,
                    arguments: post,
                  );
                },
              );
            },
          );
        }),
      
        /// 📝 CREATE POST BUTTON
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Get.bottomSheet(
              const CreatePostSheet(),
              isScrollControlled: true,
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
            );
          },
        ),
      ),
    );
  }
}
