import 'package:flutter_grocery_app/helpers/widgets/my_breadcrumb_item.dart';

class MyConstantData {
  MyConstantData(
      {this.containerRadius = 4,
      this.cardRadius = 4,
      this.buttonRadius = 4,
      this.defaultBreadCrumbItem});

  final double buttonRadius;
  final double cardRadius;
  final double containerRadius;
  final MyBreadcrumbItem? defaultBreadCrumbItem;
}

class MyConstant {
  static MyConstantData _constant = MyConstantData();

  static MyConstantData get constant => _constant;

  static setConstant(MyConstantData constantData) {
    _constant = constantData;
  }
}
