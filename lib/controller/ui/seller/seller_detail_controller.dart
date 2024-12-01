import 'package:flutter_grocery_app/model/order_detail.dart';
import 'package:flutter_grocery_app/views/my_controller.dart';

class SellerDetailController extends MyController {
  List<OrderDetail> ordersDetail = [];

  @override
  void onInit() {
    OrderDetail.dummyList.then((value) {
      ordersDetail = value.sublist(0, 10);
      update();
    });
    super.onInit();
  }
}
