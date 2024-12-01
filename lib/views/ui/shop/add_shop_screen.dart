import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_grocery_app/controller/ui/shop/add_shop_controller.dart';
import 'package:flutter_grocery_app/helpers/theme/app_themes.dart';
import 'package:flutter_grocery_app/helpers/utils/ui_mixins.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_breadcrumb.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_breadcrumb_item.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_container.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_flex.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_flex_item.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_responsiv.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_spacing.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_text.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_text_style.dart';
import 'package:flutter_grocery_app/helpers/widgets/responsive.dart';
import 'package:flutter_grocery_app/views/layout/layout.dart';
import 'package:get/get.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class AddShopScreen extends StatefulWidget {
  const AddShopScreen({super.key});

  @override
  State<AddShopScreen> createState() => _AddShopScreenState();
}

class _AddShopScreenState extends State<AddShopScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late AddShopController controller;

  @override
  void initState() {
    controller = Get.put(AddShopController(this));
    super.initState();
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
                    MyText.titleMedium(
                      "Add Shop",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Admin'),
                        MyBreadcrumbItem(name: 'Add Shop', active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: MyContainer.bordered(
                  borderRadiusAll: 12,
                  child: Column(
                    children: [
                      TabBar(
                        isScrollable: false,
                        controller: controller.fullWidthTabController,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: contentTheme.primary.withAlpha(40)),
                        splashBorderRadius: BorderRadius.circular(20),
                        tabs: [
                          Tab(
                            child: MyText.labelMedium(
                              "Business Detail",
                              fontWeight:
                                  controller.fullWidthIndex == 0 ? 600 : 500,
                              color: controller.fullWidthIndex == 0
                                  ? contentTheme.primary
                                  : null,
                            ),
                          ),
                          Tab(
                            child: MyText.labelMedium(
                              "Shop Detail",
                              fontWeight:
                                  controller.fullWidthIndex == 1 ? 600 : 500,
                              color: controller.fullWidthIndex == 1
                                  ? contentTheme.primary
                                  : null,
                            ),
                          ),
                          Tab(
                            child: MyText.labelMedium(
                              "Bank Detail",
                              fontWeight:
                                  controller.fullWidthIndex == 2 ? 600 : 500,
                              color: controller.fullWidthIndex == 2
                                  ? contentTheme.primary
                                  : null,
                            ),
                          ),
                        ],
                        indicatorSize: TabBarIndicatorSize.tab,
                      ),
                      MySpacing.height(flexSpacing),
                      MyResponsive(
                        builder: (_, __, type) {
                          return type == MyScreenMediaType.xxl ||
                                  type == MyScreenMediaType.xl ||
                                  type == MyScreenMediaType.lg
                              ? SizedBox(
                                  height: 680,
                                  child: buildTabBarView(),
                                )
                              : type == MyScreenMediaType.md ||
                                      type == MyScreenMediaType.sm ||
                                      type == MyScreenMediaType.xs
                                  ? SizedBox(
                                      height: 1180,
                                      child: buildTabBarView(),
                                    )
                                  : const SizedBox();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildTabBarView() {
    return TabBarView(
      controller: controller.fullWidthTabController,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      children: [
        buildBusinessDetail(),
        buildPersonalDetail(),
        buildBankDetail(),
      ],
    );
  }

  Widget buildBusinessDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText.bodyMedium(
          "Step 1 : ",
          fontWeight: 700,
        ),
        MySpacing.height(20),
        MyFlex(
          children: [
            MyFlexItem(
              sizes: 'lg-6',
              child:
                  buildTextField("First Name", "Enter your First Name", false),
            ),
            MyFlexItem(
              sizes: 'lg-6',
              child: buildTextField("Last Name", "Enter your Last Name", false),
            ),
            MyFlexItem(
              sizes: 'lg-6',
              child: buildTextField(
                  "Contact Number", "Enter your Contact Number", true),
            ),
            MyFlexItem(
              sizes: 'lg-6',
              child: buildTextField(
                  "Phone Number", "Enter your Phone Number", true),
            ),
            MyFlexItem(
              sizes: 'lg-6',
              child: buildTextField("Email", "Enter your Email", false),
            ),
            MyFlexItem(
              sizes: 'lg-6',
              child:
                  buildTextField("Birth of Date", "Enter Birth of Date", true),
            ),
            MyFlexItem(
              sizes: 'lg-4',
              child: buildTextField("City", "Enter Your city", false),
            ),
            MyFlexItem(
              sizes: 'lg-4',
              child: buildTextField("Country", "Enter Your Country", false),
            ),
            MyFlexItem(
              sizes: 'lg-4',
              child: buildTextField("Zip Code", "Enter Your Zip Code", true),
            ),
            MyFlexItem(
              sizes: 'lg-12',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText.bodyMedium(
                    "Description",
                    fontWeight: 600,
                    muted: true,
                  ),
                  MySpacing.height(8),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    style: MyTextStyle.bodySmall(),
                    decoration: InputDecoration(
                      hintText: "Enter Your Description",
                      hintStyle: MyTextStyle.bodySmall(xMuted: true),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                              width: 1,
                              strokeAlign: 0,
                              color:
                                  theme.colorScheme.onSurface.withAlpha(80))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                              width: 1,
                              strokeAlign: 0,
                              color:
                                  theme.colorScheme.onSurface.withAlpha(80))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                              width: 1,
                              strokeAlign: 0,
                              color:
                                  theme.colorScheme.onSurface.withAlpha(80))),
                      contentPadding: MySpacing.all(16),
                      isCollapsed: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),
                ],
              ),
            ),
            MyFlexItem(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MySpacing.height(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyContainer(
                      paddingAll: 8,
                      color: contentTheme.secondary,
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(LucideIcons.x,
                              size: 16, color: contentTheme.onSecondary),
                          MySpacing.width(8),
                          MyText.labelMedium(
                            "Close",
                            color: contentTheme.onSecondary,
                            fontWeight: 600,
                          )
                        ],
                      ),
                    ),
                    MySpacing.width(12),
                    MyContainer(
                      paddingAll: 8,
                      onTap: () {},
                      color: contentTheme.primary.withAlpha(40),
                      child: Row(
                        children: [
                          Icon(LucideIcons.save,
                              size: 16, color: contentTheme.primary),
                          MySpacing.width(8),
                          MyText.labelMedium("Save",
                              fontWeight: 600, color: contentTheme.primary)
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ))
          ],
        ),
      ],
    );
  }

  Widget buildPersonalDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText.bodyMedium(
          "Step 2 : ",
          fontWeight: 700,
        ),
        MySpacing.height(20),
        MyFlex(
          children: [
            MyFlexItem(
              sizes: 'lg-6',
              child: buildTextField(
                  "Company Name", "Enter your Company Name", false),
            ),
            MyFlexItem(
              sizes: 'lg-6',
              child:
                  buildTextField("Company Type", "Enter Company Type", false),
            ),
            MyFlexItem(
                sizes: 'lg-6',
                child: buildTextField(
                    "PAN Card Number", "Enter PAN Card Number", false)),
            MyFlexItem(
              sizes: 'lg-6',
              child: buildTextField("Fax Number", "Enter Fax Number", true),
            ),
            MyFlexItem(
              sizes: 'lg-6',
              child: buildTextField("Website", "Enter website.com", false),
            ),
            MyFlexItem(
              sizes: 'lg-6',
              child: buildTextField("Email", "Enter Email", false),
            ),
            MyFlexItem(
              sizes: 'lg-6',
              child: buildTextField("Number", "Enter Number", true),
            ),
            MyFlexItem(
              sizes: 'lg-6',
              child: buildTextField("Company Logo", "No file Choose", false),
            ),
            MyFlexItem(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyContainer(
                  paddingAll: 8,
                  color: contentTheme.secondary,
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(LucideIcons.x,
                          size: 16, color: contentTheme.onSecondary),
                      MySpacing.width(8),
                      MyText.labelMedium(
                        "Close",
                        color: contentTheme.onSecondary,
                        fontWeight: 600,
                      )
                    ],
                  ),
                ),
                MySpacing.width(12),
                MyContainer(
                  paddingAll: 8,
                  onTap: () {},
                  color: contentTheme.primary.withAlpha(40),
                  child: Row(
                    children: [
                      Icon(LucideIcons.save,
                          size: 16, color: contentTheme.primary),
                      MySpacing.width(8),
                      MyText.labelMedium("Save",
                          fontWeight: 600, color: contentTheme.primary)
                    ],
                  ),
                ),
              ],
            ))
          ],
        ),
      ],
    );
  }

  Widget buildBankDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText.bodyMedium(
          "Step 3 : ",
          fontWeight: 700,
        ),
        MySpacing.height(20),
        MyFlex(
          children: [
            MyFlexItem(
              sizes: 'lg-6',
              child: buildTextField("Bank Name", "Enter your Bank Name", false),
            ),
            MyFlexItem(
              sizes: 'lg-6',
              child: buildTextField("Branch", "Enter Your Branch", false),
            ),
            MyFlexItem(
              child: buildTextField("Account Holder Name",
                  "Enter Your Account Holder Name", false),
            ),
            MyFlexItem(
              sizes: 'lg-6',
              child: buildTextField(
                  "Account Number", "Enter Account Number", true),
            ),
            MyFlexItem(
              sizes: 'lg-6',
              child: buildTextField("IFSC Code", "Enter IFSC Code", false),
            ),
            MyFlexItem(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyContainer(
                  paddingAll: 8,
                  color: contentTheme.secondary,
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(LucideIcons.x,
                          size: 16, color: contentTheme.onSecondary),
                      MySpacing.width(8),
                      MyText.labelMedium(
                        "Close",
                        color: contentTheme.onSecondary,
                        fontWeight: 600,
                      )
                    ],
                  ),
                ),
                MySpacing.width(12),
                MyContainer(
                  paddingAll: 8,
                  onTap: () {},
                  color: contentTheme.primary.withAlpha(40),
                  child: Row(
                    children: [
                      Icon(LucideIcons.save,
                          size: 16, color: contentTheme.primary),
                      MySpacing.width(8),
                      MyText.labelMedium("Save",
                          fontWeight: 600, color: contentTheme.primary)
                    ],
                  ),
                ),
              ],
            ))
          ],
        ),
      ],
    );
  }

  buildTextField(String fieldTitle, String hintText, bool numbered) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText.labelMedium(fieldTitle),
        MySpacing.height(8),
        TextFormField(
          style: MyTextStyle.bodySmall(),
          keyboardType: numbered ? TextInputType.phone : null,
          inputFormatters: numbered
              ? <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ]
              : null,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: MyTextStyle.bodySmall(xMuted: true),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    width: 1,
                    strokeAlign: 0,
                    color: theme.colorScheme.onSurface.withAlpha(80))),
            contentPadding: MySpacing.all(16),
            isCollapsed: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
      ],
    );
  }
}
