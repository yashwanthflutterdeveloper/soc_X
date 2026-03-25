import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/routes/app_routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 7200), () {
      Get.offAllNamed(Routes.enterMobileNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFF5555),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Center(
              child: Image.asset(
                'assets/splash_gif/splash.gif',
              ),
            ),Spacer(),
            Text('Parther App',
              style: TextStyle(fontSize: 26,
                  fontWeight:FontWeight.w500,
                  color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
