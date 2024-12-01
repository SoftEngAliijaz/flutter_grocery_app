import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_grocery_app/controller/ui/shop/edit_shop_controller.dart';
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

class EditShopScreen extends StatefulWidget {
  const EditShopScreen({super.key});

  @override
  State<EditShopScreen> createState() => _EditShopScreenState();
}

class _EditShopScreenState extends State<EditShopScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late EditShopController controller;

  @override
  void initState() {
    controller = Get.put(EditShopController(this));
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
                      "Edit Shop",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Admin'),
                        MyBreadcrumbItem(name: 'Edit Shop', active: true),
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
                                  height: 700,
                                  child: buildTabBarView(),
                                )
                              : type == MyScreenMediaType.md ||
                                      type == MyScreenMediaType.sm ||
                                      type == MyScreenMediaType.xs
                                  ? SizedBox(
                                      height: 1200,
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
        MyText.bodyMedium("Step 1 : ", fontWeight: 700),
        MySpacing.height(20),
        MyFlex(
          children: [
            MyFlexItem(
              sizes: 'lg-6',
              child: buildTextField("First Name", "Enter your First Name",
                  controller.basicValidator.getController('first_name'), false),
            ),
            MyFlexItem(
              sizes: 'lg-6',
              child: buildTextField("Last Name", "Enter your Last Name",
                  controller.basicValidator.getController('last_name'), false),
            ),
            MyFlexItem(
              sizes: 'lg-6',
              child: buildTextField(
                  "Contact Number",
                  "Enter your Contact Number",
                  controller.basicValidator.getController('contact_number'),
                  true),
            ),
            MyFlexItem(
              sizes: 'lg-6',
              child: buildTextField(
                  "Phone Number",
                  "Enter your Phone Number",
                  controller.basicValidator.getController('phone_number'),
                  true),
            ),
            MyFlexItem(
              sizes: 'lg-6',
              child: buildTextField("Email", "Enter your Email",
                  controller.basicValidator.getController('email'), false),
            ),
            MyFlexItem(
              sizes: 'lg-6',
              child: buildTextField("Birth of Date", "Enter Birth of Date",
                  controller.basicValidator.getController('dob'), true),
            ),
            MyFlexItem(
              sizes: 'lg-4',
              child: buildTextField("City", "Enter Your city",
                  controller.basicValidator.getController('city'), false),
            ),
            MyFlexItem(
              sizes: 'lg-4',
              child: buildTextField("Country", "Enter Your Country",
                  controller.basicValidator.getController('country'), false),
            ),
            MyFlexItem(
              sizes: 'lg-4',
              child: buildTextField("Zip Code", "Enter Your Zip Code",
                  controller.basicValidator.getController('zip_code'), true),
            ),
            MyFlexItem(
              sizes: 'lg-12',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText.bodyMedium("Description",
                      fontWeight: 600, muted: true),
                  MySpacing.height(8),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    controller:
                        controller.basicValidator.getController('description'),
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

  Widget buildPersonalDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText.bodyMedium("Step 2 : ", fontWeight: 700),
        MySpacing.height(20),
        MyFlex(
          children: [
            MyFlexItem(
              sizes: 'lg-6',
              child: buildTextField(
                  "Company Name",
                  "Enter your Company Name",
                  controller.basicValidator.getController('company_name'),
                  false),
            ),
            MyFlexItem(
              sizes: 'lg-6',
              child: buildTextField(
                  "Company Type",
                  "Enter Company Type",
                  controller.basicValidator.getController('company_type'),
                  false),
            ),
            MyFlexItem(
              sizes: 'lg-6',
              child: buildTextField(
                  "PAN Card Number",
                  "Enter PAN Card Number",
                  controller.basicValidator.getController('pan_card_number'),
                  false),
            ),
            MyFlexItem(
              sizes: 'lg-6',
              child: buildTextField("Fax Number", "Enter Fax Number",
                  controller.basicValidator.getController('fax_number'), true),
            ),
            MyFlexItem(
              sizes: 'lg-6',
              child: buildTextField("Website", "Enter website.com",
                  controller.basicValidator.getController('website'), false),
            ),
            MyFlexItem(
              sizes: 'lg-6',
              child: buildTextField("Email", "Enter Email",
                  controller.basicValidator.getController('email'), false),
            ),
            MyFlexItem(
              sizes: 'lg-6',
              child: buildTextField(
                  "Number",
                  "Enter Number",
                  controller.basicValidator.getController('phone_number'),
                  true),
            ),
            MyFlexItem(
              sizes: 'lg-6',
              child: buildTextField("Company Logo", "No file Choose",
                  controller.basicValidator.getController('first_name'), false),
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
        MyText.bodyMedium("Step 3 : ", fontWeight: 700),
        MySpacing.height(20),
        MyFlex(
          children: [
            MyFlexItem(
              sizes: 'lg-6',
              child: buildTextField("Bank Name", "Enter your Bank Name",
                  controller.basicValidator.getController('bank_name'), false),
            ),
            MyFlexItem(
                sizes: 'lg-6',
                child: buildTextField(
                    "Branch",
                    "Enter Your Branch",
                    controller.basicValidator.getController('bank_branch'),
                    false)),
            MyFlexItem(
              child: buildTextField(
                  "Account Holder Name",
                  "Enter Your Account Holder Name",
                  controller.basicValidator
                      .getController('account_holder_name'),
                  false),
            ),
            MyFlexItem(
              sizes: 'lg-6',
              child: buildTextField(
                  "Account Number",
                  "Enter Account Number",
                  controller.basicValidator.getController('account_number'),
                  true),
            ),
            MyFlexItem(
              sizes: 'lg-6',
              child: buildTextField("IFSC Code", "Enter IFSC Code",
                  controller.basicValidator.getController('ifsc_code'), false),
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

  buildTextField(String fieldTitle, String hintText,
      TextEditingController? controller, bool numbered) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText.labelMedium(fieldTitle),
        MySpacing.height(8),
        TextFormField(
          controller: controller,
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