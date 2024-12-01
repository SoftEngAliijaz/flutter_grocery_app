import 'package:flutter_grocery_app/model/shop_data.dart';
import 'package:flutter_grocery_app/views/my_controller.dart';
import 'package:get/get.dart';

class ShopListController extends MyController {
  List<ShopData> shop = [];

  @override
  void onInit() {
    ShopData.dummyList.then((value) {
      shop = value.sublist(0, 10);
      update();
    });
    super.onInit();
  }

  void gotoShopDetail() {
    Get.toNamed('/admin/shop/detail');
  }

  void gotoAddScreen() {
    Get.toNamed('/admin/shop/create');
  }
}
