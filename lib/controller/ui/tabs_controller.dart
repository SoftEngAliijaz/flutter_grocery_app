import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_text_utils.dart';
import 'package:flutter_grocery_app/views/my_controller.dart';

class TabsController extends MyController {
  TabsController(this.tickerProvider);

  late TabController backgroundTabController = TabController(
      length: 3, vsync: tickerProvider, initialIndex: backgroundIndex);

  late TabController borderedTabController = TabController(
      length: 3, vsync: tickerProvider, initialIndex: borderedIndex);

  late TabController customTabController1 = TabController(
      length: 3, vsync: tickerProvider, initialIndex: customIndex1);

  var defaultIndex = 0,
      fullWidthIndex = 0,
      backgroundIndex = 0,
      borderedIndex = 0,
      softIndex = 0,
      customIndex1 = 0;

  late TabController defaultTabController = TabController(
      length: 3, vsync: tickerProvider, initialIndex: defaultIndex);

  List<String> dummyTexts =
      List.generate(12, (index) => MyTextUtils.getDummyText(60));

  late TabController fullWidthTabController = TabController(
      length: 3, vsync: tickerProvider, initialIndex: fullWidthIndex);

  late TabController softTabController =
      TabController(length: 3, vsync: tickerProvider, initialIndex: softIndex);

  final TickerProvider tickerProvider;

  @override
  void onInit() {
    super.onInit();
    defaultTabController.addListener(() {
      if (defaultIndex != defaultTabController.index) {
        defaultIndex = defaultTabController.index;
        update();
      }
    });
    fullWidthTabController.addListener(() {
      if (fullWidthIndex != fullWidthTabController.index) {
        fullWidthIndex = fullWidthTabController.index;
        update();
      }
    });
    backgroundTabController.addListener(() {
      if (backgroundIndex != backgroundTabController.index) {
        backgroundIndex = backgroundTabController.index;
        update();
      }
    });
    borderedTabController.addListener(() {
      if (borderedIndex != borderedTabController.index) {
        borderedIndex = borderedTabController.index;
        update();
      }
    });
    softTabController.addListener(() {
      if (softIndex != softTabController.index) {
        softIndex = softTabController.index;
        update();
      }
    });
    customTabController1.addListener(() {
      if (customIndex1 != customTabController1.index) {
        customIndex1 = customTabController1.index;
        update();
      }
    });
  }
}
