import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_grocery_app/controller/ui/grocery/grocery_edit_controller.dart';
import 'package:flutter_grocery_app/helpers/theme/app_themes.dart';
import 'package:flutter_grocery_app/helpers/utils/ui_mixins.dart';
import 'package:flutter_grocery_app/helpers/utils/utils.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_breadcrumb.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_breadcrumb_item.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_container.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_dotted_line.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_flex.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_flex_item.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_list_extension.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_spacing.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_text.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_text_style.dart';
import 'package:flutter_grocery_app/helpers/widgets/responsive.dart';
import 'package:flutter_grocery_app/views/layout/layout.dart';
import 'package:get/get.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class GroceryEditScreen extends StatefulWidget {
  const GroceryEditScreen({super.key});

  @override
  State<GroceryEditScreen> createState() => _GroceryEditScreenState();
}

class _GroceryEditScreenState extends State<GroceryEditScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late GroceryEditController controller;

  @override
  void initState() {
    controller = Get.put(GroceryEditController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        tag: 'edit_grocery_controller',
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const MyText.titleMedium(
                      "Edit Grocery",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Admin'),
                        MyBreadcrumbItem(name: 'Edit Grocery', active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: MyFlex(children: [
                  MyFlexItem(
                    sizes: 'lg-6',
                    child: MyContainer.bordered(
                      borderRadiusAll: 12,
                      paddingAll: 20,
                      child: Column(
                        children: [
                          buildTextField(
                              "Product Name",
                              "Enter Product Name",
                              controller.basicValidator.getController('name'),
                              false),
                          MySpacing.height(20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const MyText.labelMedium(
                                "Description",
                              ),
                              MySpacing.height(12),
                              TextFormField(
                                keyboardType: TextInputType.multiline,
                                maxLines: 3,
                                controller: controller.basicValidator
                                    .getController('description'),
                                style: MyTextStyle.bodySmall(),
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
                          MySpacing.height(20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const MyText.labelMedium(
                                "Category",
                              ),
                              MySpacing.height(12),
                              DropdownButtonFormField<Category>(
                                dropdownColor: contentTheme.background,
                                isDense: true,
                                items: Category.values
                                    .map(
                                      (category) => DropdownMenuItem<Category>(
                                        value: category,
                                        child: MyText.labelMedium(
                                          category.name.capitalize!,
                                        ),
                                      ),
                                    )
                                    .toList(),
                                icon: const Icon(
                                  LucideIcons.chevron_down,
                                  size: 20,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Enter your Category",
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
                                  contentPadding: MySpacing.all(12),
                                  isCollapsed: true,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                ),
                                onChanged: controller.basicValidator
                                    .onChanged<Object?>(
                                  'Category',
                                ),
                              )
                            ],
                          ),
                          MySpacing.height(20),
                          buildTextField(
                              "Price",
                              "Enter Price",
                              controller.basicValidator.getController('price'),
                              true,
                              icon: const Icon(LucideIcons.dollar_sign,
                                  size: 16)),
                        ],
                      ),
                    ),
                  ),
                  MyFlexItem(
                      sizes: 'lg-6',
                      child: MyContainer.bordered(
                        borderRadiusAll: 12,
                        paddingAll: 20,
                        child: Column(
                          children: [
                            controller.selectedStatus == Status.OutOfStock
                                ? const SizedBox()
                                : buildTextField(
                                    "Quantity",
                                    "Enter quantity",
                                    controller.basicValidator
                                        .getController('qty'),
                                    true),
                            MySpacing.height(
                                controller.selectedStatus == Status.OutOfStock
                                    ? 0
                                    : 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const MyText.labelMedium("Status"),
                                ListTile(
                                  visualDensity: VisualDensity.compact,
                                  title: Row(
                                    children: [
                                      Radio<Status>(
                                        value: Status.inStock,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        visualDensity: VisualDensity.compact,
                                        groupValue: controller.selectedStatus,
                                        onChanged: (Status? value) =>
                                            controller.onSelectedStatus(value!),
                                      ),
                                      MySpacing.width(8),
                                      const MyText('In Stock', fontWeight: 600),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  visualDensity: VisualDensity.compact,
                                  title: Row(
                                    children: [
                                      Radio<Status>(
                                        value: Status.OutOfStock,
                                        visualDensity: VisualDensity.compact,
                                        groupValue: controller.selectedStatus,
                                        onChanged: (Status? value) =>
                                            controller.onSelectedStatus(value!),
                                      ),
                                      MySpacing.width(8),
                                      const MyText('Out Of Stock',
                                          fontWeight: 600),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            MySpacing.height(20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const MyText.bodyMedium(
                                  "Please upload any file to see a previews",
                                  fontSize: 12,
                                  fontWeight: 600,
                                ),
                                MySpacing.height(20),
                                InkWell(
                                  onTap: controller.pickFile,
                                  child: MyDottedLine(
                                    strokeWidth: 0.2,
                                    color: contentTheme.onBackground,
                                    corner: const MyDottedLineCorner(
                                      leftBottomCorner: 12,
                                      leftTopCorner: 12,
                                      rightBottomCorner: 12,
                                      rightTopCorner: 12,
                                    ),
                                    child: const Center(
                                      heightFactor: 1.5,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          MyContainer(
                                            alignment: Alignment.center,
                                            width: 610,
                                            child: MyText.titleMedium(
                                              "* Recommended resolution is 640*640 with file size",
                                              muted: true,
                                              fontWeight: 500,
                                              fontSize: 16,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                if (controller.files.isNotEmpty) ...[
                                  MySpacing.height(16),
                                  Wrap(
                                    spacing: 16,
                                    runSpacing: 16,
                                    children: controller.files
                                        .mapIndexed((index, file) =>
                                            MyContainer.bordered(
                                              paddingAll: 8,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  MyContainer(
                                                    color: contentTheme
                                                        .onBackground
                                                        .withAlpha(28),
                                                    paddingAll: 8,
                                                    child: const Icon(
                                                      LucideIcons.file,
                                                      size: 20,
                                                    ),
                                                  ),
                                                  MySpacing.width(16),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      MyText.bodyMedium(
                                                        file.name,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontWeight: 600,
                                                      ),
                                                      MyText.bodySmall(Utils
                                                          .getStorageStringFromByte(
                                                              file.bytes
                                                                      ?.length ??
                                                                  0)),
                                                    ],
                                                  ),
                                                  MySpacing.width(32),
                                                  MyContainer.roundBordered(
                                                    onTap: () => controller
                                                        .removeFile(file),
                                                    paddingAll: 4,
                                                    child: const Icon(
                                                      LucideIcons.x,
                                                      size: 16,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ))
                                        .toList(),
                                  )
                                ],
                              ],
                            ),
                            MySpacing.height(20),
                            Row(
                              children: [
                                MyContainer(
                                  onTap: () {},
                                  color: contentTheme.secondary,
                                  paddingAll: 8,
                                  child: MyText.bodySmall(
                                    "Cancel",
                                    color: contentTheme.onSecondary,
                                    fontWeight: 600,
                                  ),
                                ),
                                MySpacing.width(20),
                                MyContainer(
                                  paddingAll: 8,
                                  onTap: () {},
                                  color: contentTheme.primary,
                                  child: MyText.bodySmall(
                                    "Add Product",
                                    fontWeight: 600,
                                    color: contentTheme.onPrimary,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                ]),
              ),
            ],
          );
        },
      ),
    );
  }

  buildTextField(String fieldTitle, String hintText,
      TextEditingController? controller, bool numbered,
      {Widget? icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText.labelMedium(
          fieldTitle,
        ),
        MySpacing.height(12),
        TextFormField(
          style: MyTextStyle.bodySmall(),
          keyboardType: numbered ? TextInputType.phone : null,
          inputFormatters: numbered
              ? <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ]
              : null,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: MyTextStyle.bodySmall(xMuted: true),
            prefixIcon: icon,
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
