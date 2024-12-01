import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_grocery_app/controller/ui/order_list_controller.dart';
import 'package:flutter_grocery_app/helpers/utils/ui_mixins.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_breadcrumb.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_breadcrumb_item.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_container.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_flex.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_flex_item.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_spacing.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_text.dart';
import 'package:flutter_grocery_app/helpers/widgets/responsive.dart';
import 'package:flutter_grocery_app/views/layout/layout.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> with UIMixin {
  OrderController controller = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        tag: 'order_list_controller',
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const MyText.titleMedium(
                      "Order",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Order', active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: MyFlex(
                  contentPadding: false,
                  children: [
                    MyFlexItem(
                        sizes: 'lg-3',
                        child: MyContainer.bordered(
                          onTap: controller.goSingleOrderScreen,
                          borderRadiusAll: 12,
                          paddingAll: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const MyText.titleMedium("# 5364",
                                      fontWeight: 600),
                                  MyText.bodySmall("Delivered",
                                      fontWeight: 600,
                                      color: contentTheme.success),
                                ],
                              ),
                              MySpacing.height(20),
                              MyContainer(
                                paddingAll: 0,
                                borderRadiusAll: 12,
                                height: 200,
                                width: double.infinity,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Image.asset(
                                    'assets/dummy/grocery_item/vegetable.jpg',
                                    fit: BoxFit.cover),
                              ),
                              MySpacing.height(20),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MyText.bodyMedium("Vegetable",
                                      fontWeight: 600),
                                  MyText.bodyMedium("\$120", fontWeight: 600),
                                ],
                              ),
                              MySpacing.height(8),
                              const MyText.bodySmall("Quantity : 4",
                                  fontWeight: 600, muted: true),
                              MySpacing.height(8),
                              const MyText.bodySmall(
                                  "Order Confirmed : 10 Jun 2024",
                                  fontWeight: 600,
                                  muted: true),
                              MySpacing.height(8),
                              const MyText.bodySmall(
                                  "Order Delivered : 10 Jun 2024",
                                  fontWeight: 600,
                                  muted: true),
                            ],
                          ),
                        )),
                    MyFlexItem(
                        sizes: 'lg-3',
                        child: MyContainer.bordered(
                          onTap: controller.goSingleOrderScreen,
                          borderRadiusAll: 12,
                          paddingAll: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const MyText.titleMedium("# 8394",
                                      fontWeight: 600),
                                  MyText.bodySmall("Delivered",
                                      fontWeight: 600,
                                      color: contentTheme.success),
                                ],
                              ),
                              MySpacing.height(20),
                              MyContainer(
                                paddingAll: 0,
                                borderRadiusAll: 12,
                                height: 200,
                                width: double.infinity,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Image.asset(
                                    'assets/dummy/grocery_item/coffee.jpg',
                                    fit: BoxFit.cover),
                              ),
                              MySpacing.height(20),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MyText.bodyMedium("Coffee", fontWeight: 600),
                                  MyText.bodyMedium("\$40.99", fontWeight: 600),
                                ],
                              ),
                              MySpacing.height(8),
                              const MyText.bodySmall("Quantity : 1",
                                  fontWeight: 600, muted: true),
                              MySpacing.height(8),
                              const MyText.bodySmall(
                                  "Order Confirmed : 16 April 2024",
                                  fontWeight: 600,
                                  muted: true),
                              MySpacing.height(8),
                              const MyText.bodySmall(
                                  "Order Delivered : 16 April 2024",
                                  fontWeight: 600,
                                  muted: true),
                            ],
                          ),
                        )),
                    MyFlexItem(
                        sizes: 'lg-3',
                        child: MyContainer.bordered(
                          onTap: controller.goSingleOrderScreen,
                          borderRadiusAll: 12,
                          paddingAll: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const MyText.titleMedium("# 5784",
                                      fontWeight: 600),
                                  MyText.bodySmall("Cancel",
                                      fontWeight: 600,
                                      color: contentTheme.danger),
                                ],
                              ),
                              MySpacing.height(20),
                              MyContainer(
                                paddingAll: 0,
                                borderRadiusAll: 12,
                                height: 200,
                                width: double.infinity,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Image.asset(
                                    'assets/dummy/grocery_item/drink.jpg',
                                    fit: BoxFit.cover),
                              ),
                              MySpacing.height(20),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MyText.bodyMedium("Drink", fontWeight: 600),
                                  MyText.bodyMedium("\$32.99", fontWeight: 600),
                                ],
                              ),
                              MySpacing.height(8),
                              const MyText.bodySmall("Quantity : 2",
                                  fontWeight: 600, muted: true),
                              MySpacing.height(8),
                              const MyText.bodySmall(
                                  "Order Confirmed : 05 Mar 2024",
                                  fontWeight: 600,
                                  muted: true),
                              MySpacing.height(8),
                              const MyText.bodySmall(
                                  "Order Canceled : 05 Mar 2024",
                                  fontWeight: 600,
                                  muted: true),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
