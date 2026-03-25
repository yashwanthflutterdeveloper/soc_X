import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/post_card.dart';
import 'profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      ),
      body: Obx(() {
        final p = controller.profile.value;

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// HEADER
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.black,
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, size: 40),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          p.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          p.username,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// BIO
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  p.bio,
                  style: const TextStyle(fontSize: 14),
                ),
              ),

              /// STATS
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _stat('Posts', p.posts),
                    _stat('Followers', p.followers),
                    _stat('Following', p.following),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// ACTION BUTTONS
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text('Edit Profile'),
                      ),
                    ),
                    const SizedBox(width: 12),

                    Expanded(
                      child: ElevatedButton(
                        onPressed: controller.shareProfile,
                        child: const Text('Share'),
                      ),
                    ),

                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// USER POSTS PLACEHOLDER
              /// USER POSTS
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Text(
                  'Posts',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              Obx(() {
                if (controller.isLoadingPosts.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (controller.userPosts.isEmpty) {
                  return const Center(child: Text('No posts yet'));
                }

                return ListView.builder(
                  shrinkWrap: true, // 🔥 IMPORTANT
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.userPosts.length,
                  itemBuilder: (_, i) {
                    final post = controller.userPosts[i];
                    return PostCard(
                      post: post,
                      onLike: () {},
                      onTap: () {},
                    );
                  },
                );
              }),
              const SizedBox(height: 12),
            ],
          ),
        );
      }),
    );
  }

  Widget _stat(String label, int value) {
    return Column(
      children: [

        Text(
          value.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
