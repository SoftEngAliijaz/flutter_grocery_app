import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/views/my_controller.dart';

class ToastMessageController extends MyController {
  final TickerProvider ticker;
  late AnimationController animationController =
      AnimationController(vsync: ticker, duration: const Duration(seconds: 20));

  ToastMessageController(this.ticker);
}
