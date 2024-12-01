import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/model/wallet_data.dart';
import 'package:flutter_grocery_app/views/my_controller.dart';

import 'package:flutter_grocery_app/views/ui/wallet_screen.dart';

class WalletController extends MyController {
  DataTableSource? data;
  List<WalletData> wallet = [];

  @override
  void onInit() {
    WalletData.dummyList.then((value) {
      wallet = value.sublist(0, 10);
      data = MyData(wallet);
      update();
    });
    super.onInit();
  }

  @override
  void onThemeChanged() {
    data = MyData(wallet);
    update();
  }
}
