import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MainNavController extends GetxController {
  var index = 0.obs;

  void changeTab(int i) {
    index.value = i;
  }
}
