import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:soc_x/core/routes/app_routes.dart';

import 'core/bindings/initial_binding.dart';
import 'core/deeplink/deeplink_service.dart';
import 'core/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final deepLinkService = DeepLinkService();

    @override
    void initState() {
      super.initState();
      deepLinkService.init();
    }

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      initialRoute: Routes.splash,
      getPages: AppPages.routes,
    );
  }
}

