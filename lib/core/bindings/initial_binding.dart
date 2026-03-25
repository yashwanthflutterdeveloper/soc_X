import 'package:get/get.dart';

import '../../data/services/api_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // Global services (created once)
    Get.put<ApiService>(ApiService(), permanent: true);
  }
}
