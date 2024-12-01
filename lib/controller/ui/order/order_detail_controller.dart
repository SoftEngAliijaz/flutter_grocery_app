import 'package:flutter_grocery_app/helpers/widgets/my_text_utils.dart';
import 'package:flutter_grocery_app/model/order_detail.dart';
import 'package:flutter_grocery_app/views/my_controller.dart';

class OrderDetailController extends MyController {
  List<OrderDetail> ordersDetail = [];

  List<String> dummyTexts =
      List.generate(12, (index) => MyTextUtils.getDummyText(60));

  List data = [
    {
      "name": "Drink",
      "image": "assets/dummy/grocery_item/drink.jpg",
      "price": 34,
      "quantity": 1,
      "sub_total": 34
    },
    {
      "name": "Fruits",
      "image": "assets/dummy/grocery_item/fruits.jpg",
      "price": 50,
      "quantity": 2,
      "sub_total": 100
    },
    {
      "name": "Sauce",
      "image": "assets/dummy/grocery_item/sauce.jpg",
      "price": 23.44,
      "quantity": 1,
      "sub_total": 23.44
    },
  ];

  List timeLine = ["Order received", "Processing", "On the way", "Delivered"];

  @override
  void onInit() {
    OrderDetail.dummyList.then((value) {
      ordersDetail = value.sublist(0, 10);
      update();
    });
    super.onInit();
  }
}
