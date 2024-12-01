import 'package:flutter_grocery_app/helpers/widgets/my_form_validator.dart';
import 'package:flutter_grocery_app/views/my_controller.dart';

class SettingController extends MyController {
  MyFormValidator validation = MyFormValidator();
  bool showPassword = false;
  bool resetPasswordShow = false;

  void onChangeShowPassword() {
    showPassword = !showPassword;
    update();
  }

  void onChangeResetPasswordShow() {
    resetPasswordShow = !resetPasswordShow;
    update();
  }
}