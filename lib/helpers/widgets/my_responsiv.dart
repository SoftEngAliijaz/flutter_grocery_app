import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_screen_media.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_screen_media_type.dart';

class MyResponsive extends StatelessWidget {
  const MyResponsive({
    super.key,
    required this.builder,
  });

  final Widget Function(BuildContext, BoxConstraints, MyScreenMediaType)
      builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => builder(
            context,
            constraints,
            MyScreenMedia.getTypeFromWidth(MediaQuery.of(context).size.width)));
  }
}
