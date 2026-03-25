import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../feed/feed_view.dart';
import '../profile/profile_view.dart';
import '../search/search_view.dart';
import 'main_nav_controller.dart';

class MainView extends GetView<MainNavController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = const [
      FeedView(),
      SearchView(),
      ProfileView(),
    ];

    return Obx(
          () => Scaffold(
        body: pages[controller.index.value],

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.index.value,
          onTap: controller.changeTab,
          type: BottomNavigationBarType.fixed,

          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/botton_nav_icons/home_inactive.svg",
                width: 24,
              ),
              activeIcon: SvgPicture.asset(
                "assets/botton_nav_icons/home_active.svg",
                width: 24,
              ),
              label: 'Home',
            ),

            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/botton_nav_icons/receipt_inactive.svg",
                width: 24,
              ),
              activeIcon: SvgPicture.asset(
                "assets/botton_nav_icons/receipt_active.svg",
                width: 24,
              ),
              label: 'My Bookings',
            ),

            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/botton_nav_icons/profile_inactive.svg",
                width: 24,
              ),
              activeIcon: SvgPicture.asset(
                "assets/botton_nav_icons/profile_active.svg",
                width: 24,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
