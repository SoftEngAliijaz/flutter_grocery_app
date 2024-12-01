import 'package:get/get.dart';
import 'package:flutter_grocery_app/views/my_controller.dart';

class HomeController extends MyController {
  List categoryList = [
    {"image": "assets/dummy/grocery_item/breakfast.jpg", "name": "Breakfast"},
    {"image": "assets/dummy/grocery_item/canned.jpg", "name": "Canned"},
    {"image": "assets/dummy/grocery_item/coffee.jpg", "name": "Coffee"},
    {"image": "assets/dummy/grocery_item/drink.jpg", "name": "Drink"},
    {"image": "assets/dummy/grocery_item/fruits.jpg", "name": "Fruits"},
    {"image": "assets/dummy/grocery_item/sauce.jpg", "name": "Sauce"},
    {"image": "assets/dummy/grocery_item/snacks.jpg", "name": "Snacks"},
    {"image": "assets/dummy/grocery_item/vegetable.jpg", "name": "Vegetable"}
  ];

  List nearByShop = [
    {
      "id": 1,
      "name": "Gourmet Grocery",
      "type": "Grocery Store",
      "address": "101 Food Lane, Townsville, ST 12345",
      "phone": "(123) 456-7890"
    },
    {
      "id": 2,
      "name": "Tech Galaxy",
      "type": "Electronics Store",
      "address": "202 Gadget Blvd, Townsville, ST 12345",
      "phone": "(234) 567-8901"
    },
    {
      "id": 3,
      "name": "The Book Haven",
      "type": "Bookstore",
      "address": "303 Readwell Ave, Townsville, ST 12345",
      "phone": "(345) 678-9012"
    },
    {
      "id": 4,
      "name": "Fresh Market",
      "type": "Grocery Store",
      "address": "404 Harvest St, Townsville, ST 12345",
      "phone": "(456) 789-0123"
    },
    {
      "id": 5,
      "name": "Gadget Hub",
      "type": "Electronics Store",
      "address": "505 Device Dr, Townsville, ST 12345",
      "phone": "(567) 890-1234"
    },
    {
      "id": 6,
      "name": "Page Turners",
      "type": "Bookstore",
      "address": "606 Novel Way, Townsville, ST 12345",
      "phone": "(678) 901-2345"
    }
  ];

  void goToShopDetailScreen() {
    Get.toNamed('/admin/shop/detail');
  }

  void goToGroceryDetail() {
    Get.toNamed('/admin/grocery/detail');
  }

  void goToShopScreen() {
    Get.toNamed('/grocery');
  }

  void orderStatus() {
    Get.toNamed('/orders');
  }
}
