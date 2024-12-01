import 'package:flutter_grocery_app/model/products_list_data.dart';
import 'package:flutter_grocery_app/views/my_controller.dart';
import 'package:get/get.dart';

class GroceryController extends MyController {
  List<ProductsListData> productList = [];

  @override
  void onInit() {
    ProductsListData.dummyList.then((value) {
      productList = value.sublist(0, 10);
      update();
    });
    super.onInit();
  }

  void gotoEditScreen() {
    Get.toNamed("/admin/grocery/edit");
  }

  void gotoAddScreen() {
    Get.toNamed('/admin/grocery/create');
  }

  void gotoDetailScreen() {
    Get.toNamed("/admin/grocery/detail");
  }
}