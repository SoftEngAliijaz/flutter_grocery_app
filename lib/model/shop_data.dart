import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_grocery_app/helpers/services/json_decoder.dart';
import 'package:flutter_grocery_app/constants/images.dart';
import 'package:flutter_grocery_app/model/identifier_model.dart';

class ShopData extends IdentifierModel {
  final String name, address, email, phoneNumber, image;
  final int totalProduct, totalSales;

  ShopData(super.id, this.name, this.address, this.email, this.phoneNumber,
      this.totalProduct, this.totalSales, this.image);

  static ShopData fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    String name = decoder.getString('name');
    String address = decoder.getString('address');
    String email = decoder.getString('email');
    String phoneNumber = decoder.getString('phone_number');
    int totalProduct = decoder.getInt('total_product');
    int totalSales = decoder.getInt('total_sales');
    String image = Images.randomImage(Images.shopLogo);

    return ShopData(decoder.getId, name, address, email, phoneNumber,
        totalProduct, totalSales, image);
  }

  static List<ShopData> listFromJSON(List<dynamic> list) {
    return list.map((e) => ShopData.fromJSON(e)).toList();
  }

  static List<ShopData>? _dummyList;

  static Future<List<ShopData>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!.sublist(0, 10);
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/data/shop_data.json');
  }
}
