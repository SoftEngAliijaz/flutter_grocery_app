import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/model/customer_list.dart';
import 'package:flutter_grocery_app/views/my_controller.dart';
import 'package:flutter_grocery_app/views/ui/customer/customer_list_screen.dart';
import 'package:get/get.dart';

class CustomerListController extends MyController {
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

  @override
  void onThemeChanged() {
    data = MyData(customers);
    update();
  }

  void gotoCustomerAdd() {
    Get.toNamed('/admin/customers/create');
  }
}
