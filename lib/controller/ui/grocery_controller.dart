import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/model/product_data.dart';
import 'package:flutter_grocery_app/views/my_controller.dart';

class GroceryController extends MyController {
  RangeValues rangeSlider = const RangeValues(10, 100);
  bool isChecked = false;
  List multipleSelected = [];
  List<ProductData> products = [];

  @override
  void onInit() {
    ProductData.dummyList.then((value) {
      products = value;
      update();
    });
    super.onInit();
  }

  void onChangeRangeSlider(RangeValues value) {
    rangeSlider = value;
    update();
  }

  void onChangeCheckBox(bool? value) {
    isChecked = value ?? isChecked;
    update();
  }

  void toggleSelection(int index) {
    if (checkListItems[index]["value"]) {
      checkListItems[index]["value"] = false;
      multipleSelected.remove(checkListItems[index]);
    } else {
      checkListItems[index]["value"] = true;
      multipleSelected.add(checkListItems[index]);
    }
    update();
  }

  List checkListItems = [
    {"value": false, "title": "Rice & Pluses"},
    {"value": true, "title": "Beverages"},
    {"value": false, "title": "Snacks & Munchies"},
    {"value": false, "title": "Bakery"},
    {"value": true, "title": "Dairy"},
    {"value": false, "title": "Vegetables"},
    {"value": false, "title": "Fruits"},
  ];
}
