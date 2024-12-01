import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/helpers/theme/app_themes.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_bottom_navigation_bar_item.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_container.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_spacing.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_text_style.dart';

enum MyBottomNavigationBarType {
  normal,
  containered,
}

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar(
      {super.key,
      required this.itemList,
      this.animationDuration,
      this.indicatorColor,
      this.indicatorSize,
      this.indicatorDecoration,
      this.myBottomNavigationBarType,
      this.showLabel = true,
      this.activeContainerColor,
      this.backgroundColor,
      this.showActiveLabel,
      this.labelDirection = Axis.horizontal,
      this.labelSpacing = 8,
      this.activeTitleStyle,
      this.titleStyle,
      this.initialIndex = 0,
      this.activeTitleColor,
      this.titleColor,
      this.activeTitleSize,
      this.titleSize,
      this.iconColor,
      this.activeIconColor,
      this.iconSize,
      this.activeIconSize,
      this.containerDecoration,
      this.containerShape,
      this.outerPadding,
      this.outerMargin,
      this.containerRadius,
      this.containerPadding});

  final Color? activeContainerColor;
  final Color? activeIconColor;
  final double? activeIconSize;
  final Color? activeTitleColor;
  final double? activeTitleSize;
  final TextStyle? activeTitleStyle;
  final Duration? animationDuration;
  final Color? backgroundColor;
  final Decoration? containerDecoration;
  final EdgeInsetsGeometry? containerPadding;
  final double? containerRadius;
  final BoxShape? containerShape;
  final Color? iconColor;
  final double? iconSize;
  final Color? indicatorColor;
  final Decoration? indicatorDecoration;
  final double? indicatorSize;
  final int initialIndex;
  final List<MyBottomNavigationBarItem>? itemList;
  final Axis? labelDirection;
  final double labelSpacing;
  final MyBottomNavigationBarType? myBottomNavigationBarType;
  final EdgeInsetsGeometry? outerMargin;
  final EdgeInsetsGeometry? outerPadding;
  final bool? showActiveLabel;
  final bool showLabel;
  final Color? titleColor;
  final double? titleSize;
  final TextStyle? titleStyle;

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar>
    with SingleTickerProviderStateMixin {
  late Color? activeContainerColor;
  late Color? activeIconColor;
  late double? activeIconSize;
  late Color? activeTitleColor;
  late double? activeTitleSize;
  late TextStyle? activeTitleStyle;
  late Duration? animationDuration;
  late Color? backgroundColor;
  late Decoration? containerDecoration;
  late EdgeInsetsGeometry? containerPadding;
  late double? containerRadius;
  late BoxShape? containerShape;
  late Color? iconColor;
  late double? iconSize;
  late Color? indicatorColor;
  late Decoration? indicatorDecoration;
  late double? indicatorSize;
  late List<MyBottomNavigationBarItem>? itemList;
  late MyBottomNavigationBarType? myBottomNavigationBarType;
  late EdgeInsetsGeometry? outerMargin;
  late EdgeInsetsGeometry? outerPadding;
  late bool showActiveLabel;
  late bool showLabel;
  late Color? titleColor;
  late TextStyle? titleStyle;

  late int _currentIndex;
  late TabController? _tabController;

  @override
  dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  void initState() {
    itemList = widget.itemList;
    _currentIndex = widget.initialIndex;
    _tabController = TabController(
        length: itemList!.length,
        initialIndex: widget.initialIndex,
        vsync: this);
    _tabController!.addListener(_handleTabSelection);
    _tabController!.animation!.addListener(() {
      final animationValue = _tabController!.animation!.value;
      if (animationValue - _currentIndex > 0.5) {
        setState(() {
          _currentIndex = _currentIndex + 1;
        });
      } else if (animationValue - _currentIndex < -0.5) {
        setState(() {
          _currentIndex = _currentIndex - 1;
        });
      }
    });
    super.initState();
  }

  List<Widget> getListOfViews() {
    List<Widget> viewList = [];
    for (int i = 0; i < itemList!.length; i++) {
      viewList.add(itemList![i].page!);
    }
    return viewList;
  }

  Widget getItem(int index) {
    MyBottomNavigationBarItem item = itemList![index];

    if (MyBottomNavigationBarType == MyBottomNavigationBarType.normal) {
      return Container(
        child: (_currentIndex == index)
            ? Wrap(
                direction: widget.labelDirection!,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  item.activeIcon ??
                      Icon(
                        item.activeIconData,
                        size: activeIconSize ?? item.activeIconSize ?? 14,
                        color: activeIconColor ??
                            item.activeIconColor ??
                            theme.primaryColor,
                      ),
                  widget.labelDirection == Axis.horizontal
                      ? MySpacing.width(
                          showActiveLabel ? widget.labelSpacing : 0)
                      : MySpacing.height(
                          showActiveLabel ? widget.labelSpacing : 0),
                  showActiveLabel
                      ? Text(
                          item.title!,
                          style: activeTitleStyle ??
                              item.activeTitleStyle ??
                              MyTextStyle.labelSmall(
                                  color: activeTitleColor ??
                                      item.activeTitleColor ??
                                      theme.primaryColor,
                                  fontSize:
                                      activeTitleSize ?? item.activeTitleSize),
                        )
                      : Container(),
                ],
              )
            : Wrap(
                direction: widget.labelDirection!,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  item.icon ??
                      Icon(
                        item.iconData,
                        size: iconSize ?? item.iconSize ?? 14,
                        color: iconColor ??
                            item.iconColor ??
                            theme.colorScheme.onSurface,
                      ),
                  widget.labelDirection == Axis.horizontal
                      ? MySpacing.width(showLabel ? widget.labelSpacing : 0)
                      : MySpacing.height(showLabel ? widget.labelSpacing : 0),
                  showLabel
                      ? Text(
                          item.title!,
                          style: titleStyle ??
                              item.titleStyle ??
                              MyTextStyle.labelSmall(
                                  color: titleColor ??
                                      item.titleColor ??
                                      theme.colorScheme.onSurface,
                                  fontSize: widget.titleSize ?? item.titleSize),
                        )
                      : Container(),
                ],
              ),
      );
    } else {
      Widget iconWidget;
      if (item.activeIcon != null) {
        iconWidget = item.activeIcon!;
      } else {
        iconWidget = Icon(
          item.activeIconData ?? item.iconData,
          size: activeIconSize ?? item.activeIconSize ?? 24,
          color: activeIconColor ?? item.activeIconColor ?? theme.primaryColor,
        );
      }

      return (_currentIndex == index)
          ? MyContainer(
              padding: containerPadding ?? MySpacing.all(8),
              borderRadiusAll: containerRadius ?? 8,
              shape: containerShape ?? BoxShape.rectangle,
              color: activeContainerColor,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  iconWidget,
                  MySpacing.width(showActiveLabel ? 8 : 0),
                  showActiveLabel
                      ? Text(
                          item.title!,
                          style: activeTitleStyle ??
                              item.activeTitleStyle ??
                              MyTextStyle.labelSmall(
                                  color: activeTitleColor ??
                                      item.activeTitleColor ??
                                      theme.primaryColor,
                                  fontSize:
                                      activeTitleSize ?? item.activeTitleSize),
                        )
                      : Container(),
                ],
              ),
            )
          : item.icon ??
              Icon(
                item.iconData,
                size: iconSize ?? item.iconSize ?? 24,
                color: iconColor ??
                    item.iconColor ??
                    theme.colorScheme.onSurface.withAlpha(150),
              );
    }
  }

  List<Widget> getListOfItems() {
    List<Widget> list = [];

    double singleWidth = (MediaQuery.of(context).size.width - 50) /
        (itemList!.length +
            (widget.showLabel ? 0 : (showActiveLabel ? 0.5 : 0)));

    for (int i = 0; i < itemList!.length; i++) {
      double containerWidth = widget.showLabel
          ? (singleWidth)
          : (showActiveLabel
              ? (i == _currentIndex ? singleWidth * 1.5 : singleWidth)
              : singleWidth);
      list.add(SizedBox(
        width: containerWidth,
        child: InkWell(
          child: Center(child: getItem(i)),
          onTap: () {
            setState(() {
              _currentIndex = i;
              _tabController!.index = i;
            });
          },
        ),
      ));
    }
    return list;
  }

  _handleTabSelection() {
    setState(() {
      _currentIndex = _tabController!.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // animationDuration=widget.animationDuration!;
    indicatorColor = widget.indicatorColor ?? theme.primaryColor;
    indicatorSize = widget.indicatorSize;
    indicatorDecoration = widget.indicatorDecoration;
    myBottomNavigationBarType =
        widget.myBottomNavigationBarType ?? MyBottomNavigationBarType.normal;
    showLabel = widget.showLabel;
    showActiveLabel = widget.showActiveLabel ?? true;
    activeContainerColor =
        widget.activeContainerColor ?? theme.primaryColor.withAlpha(100);
    backgroundColor = widget.backgroundColor ?? theme.colorScheme.surface;
    activeTitleStyle = widget.activeTitleStyle;
    titleStyle = widget.titleStyle;
    activeTitleColor = widget.activeTitleColor;
    titleColor = widget.titleColor;
    activeTitleSize = widget.activeTitleSize;
    iconColor = widget.iconColor;
    activeIconColor = widget.activeIconColor;
    iconSize = widget.iconSize;
    activeIconSize = widget.activeIconSize;
    containerDecoration = widget.containerDecoration;
    containerShape = widget.containerShape;
    outerPadding = widget.outerPadding;
    outerMargin = widget.outerMargin;
    containerRadius = widget.containerRadius;
    containerPadding = widget.containerPadding;

    return Column(
      children: [
        Expanded(
          child: TabBarView(
            physics: const ClampingScrollPhysics(),
            controller: _tabController,
            children: getListOfViews(),
          ),
        ),
        Container(
          padding: outerPadding ?? MySpacing.all(16),
          margin: outerMargin ?? MySpacing.zero,
          decoration: containerDecoration ??
              BoxDecoration(
                color: backgroundColor,
              ),
          child: Row(
            children: getListOfItems(),
          ),
        ),
      ],
    );
  }
}
