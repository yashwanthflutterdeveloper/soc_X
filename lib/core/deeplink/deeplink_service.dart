import 'package:app_links/app_links.dart';
import 'package:get/get.dart';

class DeepLinkService {
  final AppLinks _appLinks = AppLinks();

  void init() {
    // Cold start
    _appLinks.getInitialAppLink().then((uri) {
      if (uri != null) {
        _handleUri(uri);
      }
    });

    // Background / foreground
    _appLinks.uriLinkStream.listen((uri) {
      _handleUri(uri);
    });
  }

  void _handleUri(Uri uri) {
    if (uri.host == 'post') {
      final postId = int.tryParse(uri.queryParameters['id'] ?? '');
      final title = uri.queryParameters['title'];

      Get.toNamed(
        '/post',
        arguments: {
          'id': postId,
          'title': title,
        },
      );
    }

    if (uri.host == 'profile') {
      final userId = int.tryParse(uri.pathSegments.first);
      Get.toNamed('/profile', arguments: userId);
    }
  }
}
