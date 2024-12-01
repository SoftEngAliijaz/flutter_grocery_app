import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/controller/ui/cart_controller.dart';
import 'package:flutter_grocery_app/helpers/utils/ui_mixins.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_breadcrumb.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_breadcrumb_item.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_button.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_container.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_flex.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_flex_item.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_spacing.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_text.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_text_style.dart';
import 'package:flutter_grocery_app/helpers/widgets/responsive.dart';
import 'package:flutter_grocery_app/views/layout/layout.dart';
import 'package:get/get.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late CartController controller;

  @override
  void initState() {
    controller = Get.put(CartController());
    super.initState();
  }

  Widget buildCard() {
    return MyContainer.bordered(
      paddingAll: 20,
      borderRadiusAll: 12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyText.bodyLarge(
            'Cart Total',
            fontWeight: 600,
          ),
          MySpacing.height(20),
          buildCardDetail('sub-total', '\$240.00'),
          MySpacing.height(12),
          buildCardDetail('Delivery', 'Free'),
          MySpacing.height(12),
          buildCardDetail('Discount', '\$20.00'),
          MySpacing.height(12),
          buildCardDetail('Tax', '\$30.00'),
          MySpacing.height(12),
          const Divider(),
          MySpacing.height(12),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText.bodyLarge(
                "Total",
                fontWeight: 600,
              ),
              MyText.bodyLarge(
                "\$250.00",
                fontWeight: 600,
              )
            ],
          ),
          MySpacing.height(12),
          MyContainer(
            onTap: () {},
            width: double.infinity,
            borderRadiusAll: 30,
            paddingAll: 12,
            color: contentTheme.primary,
            child: Center(
                child: MyText.bodyMedium(
              'Proceed to Checkout',
              fontWeight: 600,
              color: contentTheme.onPrimary,
            )),
          ),
          MySpacing.height(20),
          const Divider(),
          MySpacing.height(20),
          const MyText.bodyLarge(
            'Apply Code',
            fontWeight: 600,
          ),
          MySpacing.height(20),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                isCollapsed: true,
                isDense: true,
                contentPadding: MySpacing.all(16),
                hintStyle: MyTextStyle.bodySmall(),
                hintText: "Apply Coupon Code"),
          ),
          MySpacing.height(20),
          MyContainer(
            onTap: () {},
            borderRadiusAll: 30,
            paddingAll: 12,
            color: contentTheme.primary,
            child: MyText.bodySmall(
              'Apply Code',
              fontWeight: 600,
              color: contentTheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCardDetail(String title, String subTitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyText.bodyMedium(
          title,
          fontWeight: 600,
          muted: true,
        ),
        MyText.bodyMedium(
          subTitle,
          fontWeight: 600,
          muted: true,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const MyText.titleMedium(
                      "Cart",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Cart', active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: MyFlex(
                  children: [
                    MyFlexItem(
                        sizes: 'lg-5',
                        child: MyContainer.bordered(
                          paddingAll: 20,
                          borderRadiusAll: 12,
                          child: controller.carts.isNotEmpty
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const MyText.titleMedium("Shopping Cart",
                                        fontWeight: 600),
                                    MySpacing.height(20),
                                    ListView.separated(
                                      shrinkWrap: true,
                                      itemCount: controller.carts.length,
                                      itemBuilder: (context, index) {
                                        var data = controller.carts[index];
                                        return Row(
                                          children: [
                                            MyContainer(
                                              height: 100,
                                              width: 100,
                                              paddingAll: 0,
                                              borderRadiusAll: 12,
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              child: Image.asset(data.image,
                                                  fit: BoxFit.cover),
                                            ),
                                            MySpacing.width(16),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                MyText.bodyMedium(
                                                  data.name,
                                                  fontWeight: 600,
                                                ),
                                                MyText.bodyMedium(
                                                  "Price : \$${data.price}",
                                                  fontWeight: 600,
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  children: [
                                                    MyContainer.rounded(
                                                      onTap: () => controller
                                                          .removeData(data),
                                                      child: Icon(
                                                        LucideIcons.trash,
                                                        size: 20,
                                                        color:
                                                            contentTheme.danger,
                                                      ),
                                                    ),
                                                    MyContainer.roundBordered(
                                                      onTap: () {
                                                        controller
                                                            .decrement(data);
                                                      },
                                                      paddingAll: 4,
                                                      borderRadiusAll: 2,
                                                      child: const Icon(
                                                        LucideIcons.minus,
                                                        size: 12,
                                                      ),
                                                    ),
                                                    MySpacing.width(10),
                                                    MyText.bodyMedium(
                                                      data.quantity.toString(),
                                                      fontWeight: 700,
                                                    ),
                                                    MySpacing.width(10),
                                                    MyContainer.roundBordered(
                                                      onTap: () {
                                                        controller
                                                            .increment(data);
                                                      },
                                                      paddingAll: 4,
                                                      borderRadiusAll: 2,
                                                      child: const Icon(
                                                        LucideIcons.plus,
                                                        size: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                MySpacing.height(12),
                                                MyText.bodyMedium(
                                                  "Sub Total : \$${data.subTotal}",
                                                  fontWeight: 600,
                                                ),
                                              ],
                                            )
                                          ],
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return const Divider(height: 40);
                                      },
                                    ),
                                  ],
                                )
                              : Column(
                                  children: [
                                    const MyText.titleMedium(
                                      "Data Not Found...",
                                      fontWeight: 600,
                                    ),
                                    MySpacing.height(24),
                                    MyButton(
                                      elevation: 0,
                                      padding: MySpacing.all(12),
                                      borderRadiusAll: 12,
                                      onPressed: () => controller.gotoExplore(),
                                      child: MyText.bodySmall("Explore Grocery",
                                          fontWeight: 600,
                                          color: contentTheme.onPrimary),
                                    )
                                  ],
                                ),
                        )),
                    MyFlexItem(sizes: 'lg-5', child: buildCard()),
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
