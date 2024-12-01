import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_grocery_app/controller/ui/shop/shop_detail_controller.dart';
import 'package:flutter_grocery_app/model/order_detail.dart';
import 'package:flutter_grocery_app/views/my_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardController extends MyController {
  late List<Color> colors;
  late String shaderType;
  late List<double> stops;
  List<OrderDetail> ordersDetail = [];

  @override
  void onInit() {
    OrderDetail.dummyList.then((value) {
      ordersDetail = value.sublist(0, 4);
      update();
    });
    super.onInit();
  }

  List trendingOrder = [
    {
      "image": "assets/dummy/grocery_item/breakfast.jpg",
      "name": "Breakfast",
      "orders": "13",
      "price": "\$25.00",
      "income": "\$325"
    },
    {
      "image": "assets/dummy/grocery_item/canned.jpg",
      "name": "Canned",
      "orders": "8",
      "price": "\$15.00",
      "income": "\$120"
    },
    {
      "image": "assets/dummy/grocery_item/coffee.jpg",
      "name": "Coffee",
      "orders": "5",
      "price": "\$35.00",
      "income": "\$160"
    },
    {
      "image": "assets/dummy/grocery_item/drink.jpg",
      "name": "Drink",
      "orders": "15",
      "price": "\$20.00",
      "income": "\$300"
    },
  ];

  final List<ChartSampleData> chartData = [
    ChartSampleData(x: 'Jan', y: 12),
    ChartSampleData(x: 'Feb', y: 25),
    ChartSampleData(x: 'Mar', y: 18),
    ChartSampleData(x: 'Apr', y: 30),
    ChartSampleData(x: 'May', y: 15),
    ChartSampleData(x: 'Jun', y: 8),
    ChartSampleData(x: 'Jul', y: 35),
    ChartSampleData(x: 'Aug', y: 22),
    ChartSampleData(x: 'Sep', y: 45),
    ChartSampleData(x: 'Oct', y: 70),
    ChartSampleData(x: 'Nov', y: 60),
    ChartSampleData(x: 'Dec', y: 40),
  ];

  final TooltipBehavior chart = TooltipBehavior(
    enable: true,
    format: 'point.x : point.yValue1 : point.yValue2',
  );

  void viewDetails() {
    Get.toNamed('/admin/grocery/detail');
  }
}
