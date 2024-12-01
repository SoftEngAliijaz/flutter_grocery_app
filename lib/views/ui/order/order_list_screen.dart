import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/controller/ui/order/order_list_controller.dart';
import 'package:flutter_grocery_app/helpers/utils/ui_mixins.dart';
import 'package:flutter_grocery_app/helpers/utils/utils.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_breadcrumb.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_breadcrumb_item.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_container.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_flex.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_flex_item.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_spacing.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_text.dart';
import 'package:flutter_grocery_app/helpers/widgets/responsive.dart';
import 'package:flutter_grocery_app/model/order_list.dart';
import 'package:flutter_grocery_app/views/layout/layout.dart';
import 'package:get/get.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key});

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late OrderListController controller;

  @override
  void initState() {
    controller = Get.put(OrderListController());
    super.initState();
  }

  Widget buildOrderLayout(
      IconData icon, String title, String subTitle, Color color) {
    return MyContainer.bordered(
      borderRadiusAll: 12,
      height: 160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyContainer.rounded(
            color: color.withAlpha(40),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          MySpacing.height(12),
          MyText.bodyMedium(title, fontWeight: 600),
          MySpacing.height(4),
          MyText.bodyMedium(subTitle, fontWeight: 600, muted: true),
        ],
      ),
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
                      "Order List",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Admin'),
                        MyBreadcrumbItem(name: 'Order List', active: true),
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
                        sizes: 'lg-3 md-6',
                        child: buildOrderLayout(LucideIcons.badge_dollar_sign,
                            "Grocery Delivery", '2,538', contentTheme.primary)),
                    MyFlexItem(
                        sizes: 'lg-3 md-6',
                        child: buildOrderLayout(LucideIcons.wallet,
                            "Your Balance", '\$4,834', contentTheme.success)),
                    MyFlexItem(
                        sizes: 'lg-3 md-6',
                        child: buildOrderLayout(LucideIcons.star,
                            "Satisfaction Rating", '74%', contentTheme.info)),
                    MyFlexItem(
                        sizes: 'lg-3 md-6',
                        child: buildOrderLayout(LucideIcons.rotate_ccw,
                            "Canceled Order", '12%', contentTheme.danger)),
                    MyFlexItem(
                      child: controller.data == null
                          ? const SizedBox()
                          : PaginatedDataTable(
                              header: const Row(
                                children: [
                                  MyText.titleMedium(
                                    "Order List",
                                    fontWeight: 600,
                                    fontSize: 20,
                                  ),
                                ],
                              ),
                              source: controller.data!,
                              columns: const [
                                DataColumn(
                                    label: SizedBox(
                                  width: 80,
                                  child: MyText.bodyMedium('Date',
                                      fontWeight: 600),
                                )),
                                DataColumn(
                                    label: SizedBox(
                                  width: 60,
                                  child: MyText.bodyMedium('OrderID',
                                      fontWeight: 600),
                                )),
                                DataColumn(
                                    label: SizedBox(
                                  width: 50,
                                  child: MyText.bodyMedium('Menu',
                                      fontWeight: 600),
                                )),
                                DataColumn(
                                    label: SizedBox(
                                  width: 50,
                                  child: MyText.bodyMedium('Amount',
                                      fontWeight: 600),
                                )),
                                DataColumn(
                                    label: SizedBox(
                                  width: 100,
                                  child: MyText.bodyMedium('Status',
                                      fontWeight: 600),
                                )),
                                DataColumn(
                                    label: SizedBox(
                                        width: 80,
                                        child: MyText.bodyMedium('Action',
                                            fontWeight: 600))),
                              ],
                              columnSpacing: 200,
                              horizontalMargin: 50,
                              rowsPerPage: 10,
                              dataRowMaxHeight: 60,
                            ),
                    )
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

class MyData extends DataTableSource with UIMixin {
  MyData(this.orderList);

  List<OrderList> orderList = [];

  @override
  DataRow getRow(int index) {
    OrderList order = orderList[index];

    return DataRow(
      cells: [
        DataCell(MyText.bodySmall(
          Utils.getDateStringFromDateTime(order.dateTime),
          fontWeight: 600,
        )),
        DataCell(MyText.bodySmall(
          "#${order.orderId}",
          fontWeight: 600,
        )),
        DataCell(Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.bodySmall(
              order.groceryName,
              fontWeight: 600,
            ),
            Row(
              children: [
                Icon(
                  LucideIcons.star,
                  color: contentTheme.primary,
                  size: 16,
                ),
                MySpacing.width(8),
                MyText.bodySmall(
                  order.rating.toString(),
                  fontWeight: 600,
                ),
              ],
            )
          ],
        )),
        DataCell(MyText.bodySmall("\$ ${order.amount}")),
        DataCell(
          MyContainer(
            padding: MySpacing.xy(12, 4),
            borderRadiusAll: 100,
            color: order.status == 'Refund'
                ? contentTheme.primary.withAlpha(40)
                : order.status == 'Paid'
                    ? contentTheme.success.withAlpha(40)
                    : order.status == 'Cancel'
                        ? contentTheme.danger.withAlpha(40)
                        : null,
            child: MyText.bodySmall(
              order.status,
              fontWeight: 600,
              color: order.status == 'Refund'
                  ? contentTheme.primary
                  : order.status == 'Paid'
                      ? contentTheme.success
                      : order.status == 'Cancel'
                          ? contentTheme.danger
                          : null,
            ),
          ),
        ),
        DataCell(
          InkWell(
            onTap: () => gotoOrderDetailScreen(),
            borderRadius: BorderRadius.circular(100),
            child: MyContainer(
              padding: MySpacing.xy(12, 4),
              borderRadiusAll: 100,
              color: contentTheme.secondary.withAlpha(40),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyText.bodySmall(
                    "View",
                    color: contentTheme.secondary,
                    fontWeight: 600,
                  ),
                  MySpacing.width(8),
                  Icon(
                    LucideIcons.eye,
                    size: 16,
                    color: contentTheme.secondary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => orderList.length;

  @override
  int get selectedRowCount => 0;

  void gotoOrderDetailScreen() {
    Get.toNamed('/admin/orders/detail');
  }
}
