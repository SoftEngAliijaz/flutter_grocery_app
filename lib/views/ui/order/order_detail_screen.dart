import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/controller/ui/order/order_detail_controller.dart';
import 'package:flutter_grocery_app/helpers/utils/ui_mixins.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_breadcrumb.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_breadcrumb_item.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_container.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_flex.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_flex_item.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_list_extension.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_spacing.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_text.dart';
import 'package:flutter_grocery_app/helpers/widgets/responsive.dart';
import 'package:flutter_grocery_app/views/layout/layout.dart';
import 'package:get/get.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:timelines/timelines.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({super.key});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late OrderDetailController controller;

  @override
  void initState() {
    controller = Get.put(OrderDetailController());
    super.initState();
  }

  Widget buildLogisticDetail() {
    return MyContainer.bordered(
      height: 270,
      paddingAll: 0,
      borderRadiusAll: 12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: MySpacing.xy(20, 16),
            child: const MyText.bodyLarge(
              "Logistics Details",
              fontWeight: 600,
            ),
          ),
          const Divider(height: 0),
          Padding(
            padding: MySpacing.xy(12, 12),
            child: const SizedBox(
              height: 170,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(LucideIcons.bike),
                    MyText.bodyLarge(
                      "Jay Logistics",
                      fontWeight: 600,
                    ),
                    MyText.bodyMedium(
                      "ID: JUST2023477890",
                      fontWeight: 600,
                    ),
                    MyText.bodySmall(
                      "Payment Mode: Prepaid (Debit Card)",
                      textAlign: TextAlign.center,
                      fontWeight: 600,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTotalPayment() {
    Widget buildDetail(String title, String subTitle) {
      return Padding(
        padding: MySpacing.xy(20, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText.bodyMedium(
              title,
              fontWeight: 600,
            ),
            MyText.bodySmall(
              subTitle,
              fontWeight: 600,
            ),
          ],
        ),
      );
    }

    return MyContainer.bordered(
      paddingAll: 0,
      borderRadiusAll: 12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: MySpacing.xy(20, 16),
            child: const MyText.bodyLarge(
              "Total Payment",
              fontWeight: 600,
            ),
          ),
          const Divider(height: 0),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildDetail('Subtotal :', "\$354.00"),
              const Divider(height: 0),
              buildDetail('Discount :', "20%"),
              const Divider(height: 0),
              buildDetail('Shipping :', "Free"),
              const Divider(height: 0),
              Padding(
                padding: MySpacing.xy(20, 16),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.bodyMedium(
                      "Total :",
                      fontWeight: 600,
                    ),
                    MyText.bodyMedium(
                      "\$84.00",
                      fontWeight: 600,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildAddressDetail(String title, String name, String address,
      String mail, String phoneNumber) {
    return MyContainer.bordered(
      paddingAll: 0,
      borderRadiusAll: 12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: MySpacing.xy(20, 16),
            child: MyText.bodyLarge(title, fontWeight: 600),
          ),
          const Divider(height: 0),
          Padding(
            padding: MySpacing.xy(20, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.bodyMedium(name, fontWeight: 600),
                MySpacing.height(8),
                MyText.bodySmall(
                  address,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: 600,
                  xMuted: true,
                ),
                MySpacing.height(16),
                const MyText.bodyMedium("Email", fontWeight: 600),
                MySpacing.height(4),
                MyText.bodySmall(
                  mail,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: 600,
                  xMuted: true,
                ),
                MySpacing.height(16),
                const MyText.bodyMedium("Phone Number", fontWeight: 600),
                MySpacing.height(4),
                MyText.bodySmall(
                  phoneNumber,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: 600,
                  xMuted: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildPricing(String title, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyText.bodyMedium(
          title,
          fontWeight: 600,
        ),
        MyText.bodyMedium(
          price,
          fontWeight: 600,
        ),
      ],
    );
  }

  Widget buildItemDetail(String image, String name, String price) {
    return MyContainer(
      paddingAll: 0,
      child: Row(
        children: [
          MyContainer(
            height: 60,
            width: 60,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            paddingAll: 0,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          MySpacing.width(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText.bodyMedium(name, fontWeight: 600),
              MyText.bodyMedium(
                price,
                fontWeight: 600,
                muted: true,
              ),
            ],
          )
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
                      "Order Detail",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Admin'),
                        MyBreadcrumbItem(name: 'Order Detail', active: true),
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
                        sizes: 'lg-9',
                        child: MyFlex(contentPadding: false, children: [
                          MyFlexItem(
                              child: MyContainer.bordered(
                            borderRadiusAll: 12,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const MyText.bodyMedium(
                                  "Track Order",
                                  fontWeight: 600,
                                ),
                                SizedBox(
                                  height: 100,
                                  width: double.infinity,
                                  child: Timeline.tileBuilder(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    scrollDirection: Axis.horizontal,
                                    builder: TimelineTileBuilder.fromStyle(
                                      indicatorStyle: IndicatorStyle.outlined,
                                      itemCount: controller.timeLine.length,
                                      contentsAlign: ContentsAlign.reverse,
                                      connectorStyle: ConnectorStyle.dashedLine,
                                      endConnectorStyle:
                                          ConnectorStyle.dashedLine,
                                      itemExtent: 290,
                                      contentsBuilder: (context, index) {
                                        return MyText.bodyMedium(
                                          controller.timeLine[index],
                                          fontWeight: 600,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                          MyFlexItem(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: MyContainer.bordered(
                                borderRadiusAll: 12,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                paddingAll: 0,
                                child: DataTable(
                                    sortAscending: true,
                                    onSelectAll: (_) => {},
                                    dataRowMaxHeight: 70,
                                    showBottomBorder: false,
                                    showCheckboxColumn: true,
                                    columnSpacing: 283,
                                    columns: const [
                                      DataColumn(
                                          label: MyText.labelLarge('Products')),
                                      DataColumn(
                                          label: MyText.labelLarge('Price')),
                                      DataColumn(
                                          label: MyText.labelLarge('Quantity')),
                                      DataColumn(
                                          label:
                                              MyText.labelLarge('Sub Total')),
                                    ],
                                    rows: controller.data
                                        .mapIndexed(
                                          (index, data) => DataRow(
                                            cells: [
                                              DataCell(Row(
                                                children: [
                                                  MyContainer(
                                                    borderRadiusAll: 8,
                                                    paddingAll: 0,
                                                    clipBehavior: Clip
                                                        .antiAliasWithSaveLayer,
                                                    child: Image.asset(
                                                      data['image'],
                                                      height: 40,
                                                    ),
                                                  ),
                                                  MySpacing.width(12),
                                                  MyText.bodyMedium(
                                                      data['name']),
                                                ],
                                              )),
                                              DataCell(MyText.bodySmall(
                                                  "\$${data['price']}.00")),
                                              DataCell(MyText.bodySmall(
                                                  "${data['quantity']}x")),
                                              DataCell(MyText.bodySmall(
                                                  data['sub_total']
                                                      .toString())),
                                            ],
                                          ),
                                        )
                                        .toList()),
                              ),
                            ),
                          ),
                          MyFlexItem(
                            sizes: 'lg-3',
                            child: buildAddressDetail(
                              "Billing Address",
                              "Jayson Calzoni",
                              "2123 Parker st. Allentown, New Mexico 6465",
                              "jaylon.calzoni@mail.com",
                              '(123) 654-987)',
                            ),
                          ),
                          MyFlexItem(
                            sizes: 'lg-3',
                            child: buildAddressDetail(
                              "Shipping Address",
                              "Ryan Swelter",
                              "1254 Parker st. Allentown, New Mexico 321546",
                              "ryanwestenvelt@mail.com",
                              '(123) 742-561)',
                            ),
                          ),
                          MyFlexItem(sizes: 'lg-3', child: buildTotalPayment()),
                          MyFlexItem(
                              sizes: 'lg-3', child: buildLogisticDetail()),
                        ])),
                    MyFlexItem(
                      sizes: 'lg-3',
                      child: MyContainer.bordered(
                        borderRadiusAll: 12,
                        paddingAll: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: MySpacing.xy(20, 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const MyText.bodyMedium(
                                    "Grocery Order Item Detail",
                                    fontWeight: 600,
                                  ),
                                  const MyText.bodySmall(
                                    "Order Number : 6584",
                                    fontWeight: 600,
                                  ),
                                  MySpacing.height(20),
                                  buildItemDetail(
                                      'assets/dummy/grocery_item/breakfast.jpg',
                                      '2x Breakfast',
                                      '\$200'),
                                  MySpacing.height(20),
                                  buildItemDetail(
                                      'assets/dummy/grocery_item/canned.jpg',
                                      '2x Canned',
                                      '\$50'),
                                  MySpacing.height(20),
                                  buildItemDetail(
                                      'assets/dummy/grocery_item/coffee.jpg',
                                      '2x Coffee',
                                      '\$30'),
                                ],
                              ),
                            ),
                            const Divider(height: 0),
                            Padding(
                              padding: MySpacing.xy(20, 16),
                              child: Column(
                                children: [
                                  buildPricing('Sub Total', '\$280'),
                                  buildPricing('Delivery Free', '\$9.12'),
                                  buildPricing('Taxes', '\$25.10'),
                                ],
                              ),
                            ),
                            const Divider(height: 0),
                            Padding(
                              padding: MySpacing.xy(20, 16),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MyText.titleLarge(
                                    'Total',
                                    fontWeight: 600,
                                  ),
                                  MyText.titleLarge(
                                    '\$314.12',
                                    fontWeight: 600,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
