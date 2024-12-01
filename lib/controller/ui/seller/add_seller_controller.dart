import 'package:flutter_grocery_app/helpers/widgets/my_form_validator.dart';
import 'package:flutter_grocery_app/views/my_controller.dart';

enum Country {
  Afghanistan,
  Madagascar,
  Bahrain,
  Monaco,
  Samoa,
  China,
  Oman,
  Azerbaijan;

  const Country();
}

enum StateName {
  Alabama,
  Alaska,
  Arizona,
  Arkansas,
  California,
  Colorado,
  Connecticut;

  const StateName();
}

class AddSellerController extends MyController {
  MyFormValidator basicValidator = MyFormValidator();
}
