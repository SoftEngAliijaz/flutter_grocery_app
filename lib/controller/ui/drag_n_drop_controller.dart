import 'package:flutter/material.dart';
import 'package:flutter_reorderable_grid_view/widgets/reorderable_builder.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_text_utils.dart';
import 'package:flutter_grocery_app/model/drag_n_drop.dart';
import 'package:flutter_grocery_app/views/my_controller.dart';

class DragNDropController extends MyController {
  List<DragNDropModel> contact = [];
  final scrollController = ScrollController();
  final gridViewKey = GlobalKey();
  List<String> dummyTexts =
      List.generate(12, (index) => MyTextUtils.getDummyText(60));

  @override
  void onInit() {
    DragNDropModel.dummyList.then((value) {
      contact = value;
      update();
    });
    super.onInit();
  }

  void onReorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    DragNDropModel customer = contact.removeAt(oldIndex);
    contact.insert(newIndex, customer);
    update();
  }

  void onReorderList(ReorderedListFunction reorderedListFunction) {
    contact = reorderedListFunction(contact) as List<DragNDropModel>;
    update();
  }
}
