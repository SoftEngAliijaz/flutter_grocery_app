import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/model/customer_list.dart';
import 'package:flutter_grocery_app/views/my_controller.dart';

import 'package:flutter_grocery_app/views/ui/seller/seller_list_screen.dart';
import 'package:get/get.dart';

class SellerListController extends MyController {
  List<CustomersList> customers = [];
  DataTableSource? data;

  @override
  void onInit() {
    CustomersList.dummyList.then((value) {
      customers = value.sublist(0, 10);
      data = MyData(customers);
      update();
    });
    super.onInit();
  }

  void gotoAddSeller() {
    Get.toNamed('/admin/sellers/create');
  }

  @override
  void onThemeChanged() {
    data = MyData(customers);
    update();
  }
}