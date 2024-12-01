import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_middleware.dart';

class MyRoute {
  MyRoute({required this.name, required this.builder, this.middlewares});

  WidgetBuilder builder;
  List<MyMiddleware>? middlewares;
  String name;
}
