import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_grocery_app/helpers/services/auth_services.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_form_validator.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_validators.dart';
import 'package:flutter_grocery_app/views/my_controller.dart';

class ResetPasswordController extends MyController {
  MyFormValidator basicValidator = MyFormValidator();
  var greeting = "Good Morning";
  late int currentTime = DateTime.now().hour;
  bool showPassword = false, loading = false;

  bool confirmPassword = false;

  @override
  void onInit() {
    super.onInit();
    if ((currentTime < 6) || (currentTime > 21)) {
      greeting = 'Good Night';
    } else if (currentTime < 12) {
      greeting = 'Good Morning';
    } else if (currentTime < 18) {
      greeting = 'Good Afternoon';
    } else if (currentTime < 22) {
      greeting = 'Good Evening';
    }
    basicValidator.addField(
      'password',
      required: true,
      validators: [
        MyLengthValidator(min: 6, max: 10),
      ],
      controller: TextEditingController(),
    );
    basicValidator.addField(
      'confirm_password',
      required: true,
      label: "Confirm password",
      validators: [
        MyLengthValidator(min: 6, max: 10),
      ],
      controller: TextEditingController(),
    );
  }

  Future<void> onResetPassword() async {
    if (basicValidator.validateForm()) {
      loading = true;
      update();
      var errors = await AuthService.loginUser(basicValidator.getData());
      if (errors != null) {
        basicValidator.addErrors(errors);
        basicValidator.validateForm();
        basicValidator.clearErrors();
      }
      Get.toNamed('/home');
      loading = false;
      update();
    }
  }

  void onChangeShowPassword() {
    showPassword = !showPassword;
    update();
  }

  void onConfirmPassword() {
    confirmPassword = !confirmPassword;
    update();
  }
}
