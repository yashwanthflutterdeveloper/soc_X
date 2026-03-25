import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import '../../data/models/post_model.dart';
import '../../data/models/profile_model.dart';
import '../../data/services/api_service.dart';

class ProfileController extends GetxController {
  final ApiService _api = ApiService();

  final profile = ProfileModel(
    id: 1,
    name: 'John Doe',
    username: 'johndoe',
    bio: 'Building cool things 🚀',
    posts: 0,
    followers: 120,
    following: 80,
  ).obs;

  final userPosts = <Post>[].obs;
  final isLoadingPosts = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserPosts();
  }

  Future<void> fetchUserPosts() async {
    try {
      isLoadingPosts.value = true;
      final posts = await _api.fetchPostsByUser(profile.value.id);
      userPosts.assignAll(posts);

      profile.value = profile.value.copyWith(posts: posts.length);
    } finally {
      isLoadingPosts.value = false;
    }
  }

  /// 🔗 SHARE PROFILE

  void shareProfile() {
    final p = profile.value;
    final link = 'myapp://profile/${p.name}';

    Share.share(
      '''
👋 Check out ${p.name} on SocialX

${p.bio}

@${p.username}

$link
''',
      subject: '${p.name} on SocialX',
    );
  }
}
