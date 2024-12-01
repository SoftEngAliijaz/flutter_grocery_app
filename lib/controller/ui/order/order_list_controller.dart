import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/model/order_list.dart';
import 'package:flutter_grocery_app/views/my_controller.dart';
import 'package:flutter_grocery_app/views/ui/order/order_list_screen.dart';

class OrderListController extends MyController {
  List<OrderList> orderList = [];

  DataTableSource? data;

  @override
  void onInit() {
    super.onInit();
    OrderList.dummyList.then((value) {
      orderList = value.sublist(0, 10);
      data = MyData(orderList);
      update();
    });
  }

  @override
  void onThemeChanged() {
    data = MyData(orderList);
    update();
  }
}
