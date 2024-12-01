import 'package:flutter_grocery_app/helpers/utils/my_utils.dart';
import 'package:flutter_grocery_app/model/product_data.dart';
import 'package:flutter_grocery_app/views/my_controller.dart';

class GroceryDetailController extends MyController {
  List<ProductData> products = [];
  var itemCountPlus = 59;
  var itemCount = 1;
  List<String> dummyTexts =
      List.generate(12, (index) => MyTextUtils.getDummyText(60));

  String selectedImage = "assets/dummy/grocery_item/breakfast.jpg";

  List<String> images = [
    "assets/dummy/grocery_item/breakfast.jpg",
    "assets/dummy/grocery_item/canned.jpg",
    "assets/dummy/grocery_item/coffee.jpg",
  ];

  @override
  void onInit() {
    ProductData.dummyList.then((value) {
      products = value;
      update();
    });
    super.onInit();
  }

  void onChangeImage(String image) {
    selectedImage = image;
    update();
  }

  void priceIncrement() {
    itemCount++;
    update();
  }

  void priceDecrement() {
    itemCount--;
    update();
  }
}
