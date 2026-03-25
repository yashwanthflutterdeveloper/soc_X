import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../data/models/post_model.dart';

class PostCard extends StatelessWidget {
  final Post post;
  final VoidCallback onTap;
  final VoidCallback onLike;

  const PostCard({
    super.key,
    required this.post,
    required this.onTap,
    required this.onLike,
  });

  void _sharePost() {
    final deepLink = 'myapp://post/${post.id}';
    Share.share(
      'Check out this post:\n$deepLink',
    );
  }
  String getPostLink(int postId) {
    return 'myapp://post/$postId';
  }
  String buildPostLink({
    required int id,
    required String title,
  }) {
    final encodedTitle = Uri.encodeComponent(title);

    return 'myapp://$encodedTitle';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// TITLE
            Container(
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12),
                color: Colors.cyan[100],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  post.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 6),

            /// BODY
            Text(
              post.body,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 12),

            /// ACTION BAR
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.red),
                  onPressed: onLike,
                ),
                Text(post.likes.toString()),

                const SizedBox(width: 16),

                const Icon(Icons.comment),
                const SizedBox(width: 4),
                Text(post.commentsCount.toString()),

                const Spacer(),

      IconButton(
        icon: const Icon(Icons.share),
        onPressed: () {
          final link = buildPostLink(
            id: post.id,
            title: post.title,
          );

          Share.share(
            ' ${post.title}\n\n$link',
            subject: post.title,
          );
        },
      ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, size: 16),
                  onPressed: onTap,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
