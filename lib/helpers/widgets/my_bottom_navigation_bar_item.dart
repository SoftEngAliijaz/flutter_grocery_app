import 'package:flutter/material.dart';

class MyBottomNavigationBarItem {
  MyBottomNavigationBarItem(
      {required this.page,
      this.title,
      this.activeTitleStyle,
      this.titleStyle,
      this.activeTitleColor,
      this.titleColor,
      this.activeTitleSize,
      this.titleSize,
      this.iconData,
      this.activeIconData,
      this.icon,
      this.activeIcon,
      this.iconColor,
      this.activeIconColor,
      this.iconSize,
      this.activeIconSize});

  final Widget? activeIcon;
  final Color? activeIconColor;
  final IconData? activeIconData;
  final double? activeIconSize;
  final Color? activeTitleColor;
  final double? activeTitleSize;
  final TextStyle? activeTitleStyle;
  final Widget? icon;
  final Color? iconColor;
  final IconData? iconData;
  final double? iconSize;
  final Widget? page;
  final String? title;
  final Color? titleColor;
  final double? titleSize;
  final TextStyle? titleStyle;
}
