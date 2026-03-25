import 'package:get/get.dart';
import 'package:soc_x/modules/main/mian_binding.dart';
import 'package:soc_x/modules/posts/post_view.dart';
import 'package:soc_x/modules/search/search_binding.dart';
import 'package:soc_x/modules/search/search_view.dart';
import '../../modules/feed/feed_binding.dart';
import '../../modules/feed/feed_view.dart';
import '../../modules/main/main_view.dart';
import '../../modules/onboarding/enter_mobile_number_view.dart';
import '../../modules/onboarding/otp_verification.dart';
import '../../modules/posts/post_binding.dart';
import '../../modules/profile/profile_binding.dart';
import '../../modules/profile/profile_view.dart';
import '../../modules/splash/splash_view.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashView()),
    GetPage(
        name: Routes.enterMobileNumber,
        page: () =>  EnterMobileNumberView()),
    GetPage(name: Routes.otpVerification,
        page: () => OtpVerification()
    ),



    GetPage(
      name: Routes.feed,
      page: () => const FeedView(),
      binding: FeedBinding(),
    ),
    GetPage(
      name: Routes.postDetail,
      page: () => const PostDetailView(),
      binding: PostBinding(),
    ),
    GetPage(name: Routes.search,
        page: () => const SearchView(),
        binding: SearchBinding(),
    ),
    GetPage(name: Routes.main,
        page: () => const MainView(),
      binding: MainBinding()
    ),
    GetPage(name: Routes.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding()
    )
  ];

}

