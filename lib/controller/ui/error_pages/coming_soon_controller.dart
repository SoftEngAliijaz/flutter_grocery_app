import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter_grocery_app/views/my_controller.dart';

class ComingSoonController extends MyController {
  Timer? countdownTimer;
  Duration myDuration = const Duration(days: 8);

  void setCountDown() {
    const reduceSecondsBy = 1;
    final seconds = myDuration.inSeconds - reduceSecondsBy;
    if (seconds >= 0) {
      myDuration = Duration(seconds: seconds);
    }
    update();
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  void goToDashboardScreen() {
    Get.back();
  }
}
