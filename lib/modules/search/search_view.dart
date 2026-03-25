import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/routes/app_routes.dart';
import '../../widgets/post_card.dart';
import 'search_controller.dart';

class SearchView extends GetView<SearchclassController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(

          controller: controller.searchController,
          textInputAction: TextInputAction.search,
          decoration: const InputDecoration(
            hintText: 'Search posts',
            border: InputBorder.none,
          ),
          onSubmitted: (_) => controller.searchPosts(),
        ),
        actions: [
          Obx(() => controller.hasSearched.value
              ? IconButton(
            icon: const Icon(Icons.close),
            onPressed: controller.clearSearch,
          )
              : const SizedBox()),
        ],
      ),

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!controller.hasSearched.value) {
          return const Center(
            child: Text(
              'Search for posts',
              style: TextStyle(fontSize: 16),
            ),
          );
        }

        if (controller.results.isEmpty) {
          return Center(
            child: Column(
              children: [
                Text('No posts found'),
            GestureDetector(
              onTap: () async {
                final url = Uri.parse('https://flutter.dev');
                await launchUrl(url);
              },
              child: Text(
                'Visit Flutter Website',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'Read our ',
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        final url = Uri.parse('https://example.com/privacy');
                        await launchUrl(url);
                      },
                  ),
                ],
              ),
            )

            ],
            ),
          );
        }

        return ListView.builder(
          itemCount: controller.results.length,
          itemBuilder: (_, index) {
            final post = controller.results[index];
            return PostCard(
              post: post,
              onTap: () {
                Get.toNamed(
                  Routes.postDetail,
                  arguments: post,
                );
              }, onLike: () {  },
            );
          },
        );
      }),
    );
  }
}
