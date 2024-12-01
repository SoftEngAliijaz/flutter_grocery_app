import 'package:get/get.dart';
import 'package:flutter_grocery_app/views/my_controller.dart';

class OrderController extends MyController {
  void goSingleOrderScreen() {
    Get.toNamed('/admin/orders/detail');
  }
}
