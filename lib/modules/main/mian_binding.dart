import 'package:get/get.dart';
import 'package:soc_x/modules/main/main_nav_controller.dart';
import 'package:soc_x/modules/profile/profile_controller.dart';
import '../search/search_controller.dart';
import '../feed/feed_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainNavController>(() => MainNavController(), fenix: true);

    // 🔥 KEEP THESE ALIVE FOR TAB SWITCHING
    Get.lazyPut<FeedController>(() => FeedController(), fenix: true);
    Get.lazyPut<SearchclassController>(() => SearchclassController(), fenix: true);
    Get.lazyPut<MainNavController>(() => MainNavController(), fenix: true);
    Get.lazyPut<ProfileController>(()=> ProfileController(),fenix: true);
  }
}
