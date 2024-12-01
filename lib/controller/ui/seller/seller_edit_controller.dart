import 'package:flutter/material.dart';
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

class SellerEditController extends MyController {
  MyFormValidator basicValidator = MyFormValidator();

  final String _dummyFirstName = "Alison";
  final String _dummyLastName = "Joh";
  final String _dummyUserName = "den_156";
  final String _dummyEmail = "demo@gmail.com";
  final String _dummyPhoneNumber = "+80 65498125";
  final String _dummyZipCode = "35010";
  final String _dummyDescription =
      "Hi, I'm Alison, it has been the industry's standard dummy text since the 1500s when an unknown printer took a galley of type.";

  @override
  void onInit() {
    basicValidator.addField('first_name',
        controller: TextEditingController(text: _dummyFirstName));
    basicValidator.addField('last_name',
        controller: TextEditingController(text: _dummyLastName));
    basicValidator.addField('user_name',
        controller: TextEditingController(text: _dummyUserName));
    basicValidator.addField('email',
        controller: TextEditingController(text: _dummyEmail));
    basicValidator.addField('phone_number',
        controller: TextEditingController(text: _dummyPhoneNumber));
    basicValidator.addField('zip_code',
        controller: TextEditingController(text: _dummyZipCode));
    basicValidator.addField('description',
        controller: TextEditingController(text: _dummyDescription));
    super.onInit();
  }
}
