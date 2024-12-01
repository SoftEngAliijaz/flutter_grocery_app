import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_grocery_app/controller/ui/seller/add_seller_controller.dart';
import 'package:flutter_grocery_app/helpers/theme/app_themes.dart';
import 'package:flutter_grocery_app/helpers/utils/ui_mixins.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_breadcrumb.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_breadcrumb_item.dart';
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

class AddSellerScreen extends StatefulWidget {
  const AddSellerScreen({super.key});

  @override
  State<AddSellerScreen> createState() => _AddSellerScreenState();
}

class _AddSellerScreenState extends State<AddSellerScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late AddSellerController controller;

  @override
  void initState() {
    controller = Get.put(AddSellerController());
    super.initState();
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
                      "Add Seller",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Admin'),
                        MyBreadcrumbItem(name: 'Add Seller', active: true),
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
                  padding: MySpacing.all(20),
                  child: Column(
                    children: [
                      MyFlex(
                        contentPadding: false,
                        children: [
                          MyFlexItem(
                            sizes: "md-6 sm-12",
                            child: buildTextField(
                                'First Name', "Enter First Name", false),
                          ),
                          MyFlexItem(
                            sizes: "md-6 sm-12",
                            child: buildTextField(
                                "Last Name", "Enter Last Name", false),
                          ),
                          MyFlexItem(
                            sizes: "md-6 sm-12",
                            child: buildTextField(
                                'User Name', "Enter User Name", false),
                          ),
                          MyFlexItem(
                            sizes: "md-6 sm-12",
                            child:
                                buildTextField("Email", "Enter Email", false),
                          ),
                          MyFlexItem(
                            sizes: "md-6 sm-12",
                            child: buildTextField(
                                'Phone Number', "Enter Phone Number", true),
                          ),
                          MyFlexItem(
                              sizes: "md-6 sm-12",
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const MyText.labelMedium("Country"),
                                  MySpacing.height(8),
                                  DropdownButtonFormField<Country>(
                                    dropdownColor: contentTheme.background,
                                    isDense: true,
                                    items: Country.values
                                        .map(
                                          (category) =>
                                              DropdownMenuItem<Country>(
                                            value: category,
                                            child: MyText.labelMedium(
                                                category.name.capitalize!),
                                          ),
                                        )
                                        .toList(),
                                    icon: const Icon(LucideIcons.chevron_down,
                                        size: 20),
                                    decoration: InputDecoration(
                                      hintText: "Select Country",
                                      hintStyle:
                                          MyTextStyle.bodySmall(xMuted: true),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              width: 1,
                                              strokeAlign: 0,
                                              color: theme.colorScheme.onSurface
                                                  .withAlpha(80))),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              width: 1,
                                              strokeAlign: 0,
                                              color: theme.colorScheme.onSurface
                                                  .withAlpha(80))),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              width: 1,
                                              strokeAlign: 0,
                                              color: theme.colorScheme.onSurface
                                                  .withAlpha(80))),
                                      contentPadding: MySpacing.all(12),
                                      isCollapsed: true,
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                    ),
                                    onChanged: controller.basicValidator
                                        .onChanged<Object?>('Country'),
                                  )
                                ],
                              )),
                          MyFlexItem(
                              sizes: "md-6 sm-12",
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const MyText.labelMedium("State"),
                                  MySpacing.height(8),
                                  DropdownButtonFormField<StateName>(
                                    dropdownColor: contentTheme.background,
                                    isDense: true,
                                    items: StateName.values
                                        .map(
                                          (category) =>
                                              DropdownMenuItem<StateName>(
                                            value: category,
                                            child: MyText.labelMedium(
                                                category.name.capitalize!),
                                          ),
                                        )
                                        .toList(),
                                    icon: const Icon(LucideIcons.chevron_down,
                                        size: 20),
                                    decoration: InputDecoration(
                                        hintText: "Select State",
                                        hintStyle:
                                            MyTextStyle.bodySmall(xMuted: true),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                                width: 1,
                                                strokeAlign: 0,
                                                color: theme
                                                    .colorScheme.onSurface
                                                    .withAlpha(80))),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                                width: 1,
                                                strokeAlign: 0,
                                                color: theme
                                                    .colorScheme.onSurface
                                                    .withAlpha(80))),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                                width: 1,
                                                strokeAlign: 0,
                                                color: theme.colorScheme.onSurface.withAlpha(80))),
                                        contentPadding: MySpacing.all(12),
                                        isCollapsed: true,
                                        floatingLabelBehavior: FloatingLabelBehavior.never),
                                    onChanged: controller.basicValidator
                                        .onChanged<Object?>('State'),
                                  )
                                ],
                              )),
                          MyFlexItem(
                            sizes: "md-6 sm-12",
                            child: buildTextField(
                                'Zip Code', "Enter Zip Code", true),
                          ),
                          MyFlexItem(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const MyText.labelMedium("Description"),
                                MySpacing.height(8),
                                TextFormField(
                                  style: MyTextStyle.bodySmall(),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                    hintText: "It's contains blah blah things",
                                    hintStyle:
                                        MyTextStyle.bodySmall(xMuted: true),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            width: 1,
                                            strokeAlign: 0,
                                            color: theme.colorScheme.onSurface
                                                .withAlpha(80))),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            width: 1,
                                            strokeAlign: 0,
                                            color: theme.colorScheme.onSurface
                                                .withAlpha(80))),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            width: 1,
                                            strokeAlign: 0,
                                            color: theme.colorScheme.onSurface
                                                .withAlpha(80))),
                                    contentPadding: MySpacing.all(16),
                                    isCollapsed: true,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      MySpacing.height(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MyContainer(
                            paddingAll: 8,
                            borderRadiusAll: 8,
                            color: contentTheme.secondary,
                            onTap: () {},
                            child: Row(
                              children: [
                                Icon(LucideIcons.x,
                                    size: 16, color: contentTheme.onSecondary),
                                MySpacing.width(8),
                                MyText.bodySmall("Close",
                                    color: contentTheme.onSecondary,
                                    fontWeight: 600)
                              ],
                            ),
                          ),
                          MySpacing.width(12),
                          MyContainer(
                            paddingAll: 8,
                            borderRadiusAll: 8,
                            onTap: () {},
                            color: contentTheme.primary.withAlpha(40),
                            child: Row(
                              children: [
                                Icon(LucideIcons.save,
                                    size: 16, color: contentTheme.primary),
                                MySpacing.width(8),
                                MyText.bodySmall("Save",
                                    fontWeight: 600,
                                    color: contentTheme.primary)
                              ],
                            ),
                          ),
                        ],
                      )
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
}
