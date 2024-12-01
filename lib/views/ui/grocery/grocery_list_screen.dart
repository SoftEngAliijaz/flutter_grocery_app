import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/controller/ui/grocery/grocery_controller.dart';
import 'package:flutter_grocery_app/helpers/utils/ui_mixins.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_breadcrumb.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_breadcrumb_item.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_container.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_list_extension.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_spacing.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_text.dart';
import 'package:flutter_grocery_app/helpers/widgets/responsive.dart';
import 'package:flutter_grocery_app/views/layout/layout.dart';
import 'package:get/get.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class GroceryListScreen extends StatefulWidget {
  const GroceryListScreen({super.key});

  @override
  State<GroceryListScreen> createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late GroceryController controller;

  @override
  void initState() {
    controller = GroceryController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        tag: 'grocery_list_controller',
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium(
                      "Grocery List",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Admin'),
                        MyBreadcrumbItem(name: 'Grocery List', active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: MyContainer.bordered(
                  paddingAll: 20,
                  borderRadiusAll: 12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 250,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(4),
                                    ),
                                  ),
                                  prefixIcon:
                                      Icon(LucideIcons.search, size: 20),
                                  hintText: 'Search',
                                  contentPadding: MySpacing.xy(12, 4)),
                            ),
                          ),
                          MyContainer(
                            onTap: () => controller.gotoAddScreen(),
                            paddingAll: 8,
                            color: contentTheme.primary,
                            child: Row(
                              children: [
                                Icon(
                                  LucideIcons.plus,
                                  size: 20,
                                  color: contentTheme.onPrimary,
                                ),
                                MySpacing.width(8),
                                MyText.bodyMedium(
                                  "Add New Grocery",
                                  color: contentTheme.onPrimary,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                            sortAscending: true,
                            onSelectAll: (_) => {},
                            dataRowMaxHeight: 60,
                            columnSpacing: 220,
                            showBottomBorder: false,
                            showCheckboxColumn: true,
                            columns: [
                              DataColumn(label: MyText.labelLarge('Name')),
                              DataColumn(label: MyText.labelLarge('SKU')),
                              DataColumn(label: MyText.labelLarge('Price')),
                              DataColumn(label: MyText.labelLarge('Rating')),
                              DataColumn(label: MyText.labelLarge('Status')),
                              DataColumn(label: MyText.labelLarge('Action')),
                            ],
                            rows: controller.productList
                                .mapIndexed(
                                  (index, data) => DataRow(
                                    cells: [
                                      DataCell(MyText.bodySmall(data.name,
                                          fontWeight: 600)),
                                      DataCell(MyText.bodySmall(
                                          "SKU-${data.sku}",
                                          fontWeight: 600)),
                                      DataCell(MyText.bodySmall(
                                          "\$${data.price}.00",
                                          fontWeight: 600)),
                                      DataCell(Row(
                                        children: [
                                          Icon(LucideIcons.star,
                                              size: 16,
                                              color: contentTheme.primary),
                                          MySpacing.width(8),
                                          MyText.bodySmall("${data.rating}",
                                              fontWeight: 600),
                                        ],
                                      )),
                                      DataCell(MyContainer(
                                        padding: MySpacing.xy(12, 4),
                                        color: data.status == "Draft"
                                            ? contentTheme.primary.withAlpha(36)
                                            : data.status == "Publish"
                                                ? contentTheme.success
                                                    .withAlpha(36)
                                                : data.status == "Pending"
                                                    ? contentTheme.danger
                                                        .withAlpha(36)
                                                    : null,
                                        child: MyText.bodySmall(data.status,
                                            color: data.status == "Draft"
                                                ? contentTheme.primary
                                                : data.status == "Publish"
                                                    ? contentTheme.success
                                                    : data.status == "Pending"
                                                        ? contentTheme.danger
                                                        : null,
                                            fontWeight: 600),
                                      )),
                                      DataCell(Row(
                                        children: [
                                          InkWell(
                                              onTap: () =>
                                                  controller.gotoEditScreen(),
                                              child: Icon(LucideIcons.pencil,
                                                  size: 16)),
                                          MySpacing.width(8),
                                          InkWell(
                                              onTap: () =>
                                                  controller.gotoDetailScreen(),
                                              child: Icon(LucideIcons.eye,
                                                  size: 16)),
                                        ],
                                      ))
                                    ],
                                  ),
                                )
                                .toList()),
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
}
