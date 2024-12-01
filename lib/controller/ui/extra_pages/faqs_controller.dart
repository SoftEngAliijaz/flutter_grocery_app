import 'package:flutter_grocery_app/helpers/widgets/my_text_utils.dart';
import 'package:flutter_grocery_app/views/my_controller.dart';

class FaqsController extends MyController {
  final List<bool> dataExpansionPanel = [
    true,
    false,
    false,
    false,
    false,
    false
  ];
  List<String> dummyTexts =
      List.generate(12, (index) => MyTextUtils.getDummyText(60));
}
