import 'package:flutter_grocery_app/views/my_controller.dart';
import 'package:get/get.dart';

class Error500Controller extends MyController {
  void goToDashboardScreen() {
    Get.back();
  }
}
