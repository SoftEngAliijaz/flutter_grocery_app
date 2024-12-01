import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/views/my_controller.dart';

class AddShopController extends MyController {
  int fullWidthIndex = 0;
  final TickerProvider tickerProvider;

  late TabController fullWidthTabController = TabController(
      length: 3, vsync: tickerProvider, initialIndex: fullWidthIndex);

  AddShopController(this.tickerProvider) {
    fullWidthTabController.addListener(() {
      fullWidthIndex = fullWidthTabController.index;
      update();
    });
  }
}
