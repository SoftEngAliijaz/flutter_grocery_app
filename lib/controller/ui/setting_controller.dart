import 'package:flutter_grocery_app/helpers/widgets/my_form_validator.dart';
import 'package:flutter_grocery_app/views/my_controller.dart';

class SettingController extends MyController {
  bool resetPasswordShow = false;
  bool showPassword = false;
  MyFormValidator validation = MyFormValidator();

  void onChangeShowPassword() {
    showPassword = !showPassword;
    update();
  }

  void onChangeResetPasswordShow() {
    resetPasswordShow = !resetPasswordShow;
    update();
  }
}
