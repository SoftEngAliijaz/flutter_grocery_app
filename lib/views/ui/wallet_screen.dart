import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/controller/ui/wallet_controller.dart';
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
import 'package:flutter_grocery_app/model/wallet_data.dart';
import 'package:flutter_grocery_app/views/layout/layout.dart';
import 'package:get/get.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late WalletController controller;

  @override
  void initState() {
    controller = Get.put(WalletController());
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
                    const MyText.titleMedium(
                      "Wallet",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Admin'),
                        MyBreadcrumbItem(name: 'Wallet', active: true),
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
                      sizes: 'lg-8',
                      child: Column(
                        children: [
                          if (controller.data != null)
                            PaginatedDataTable(
                              header: const Row(
                                children: [
                                  MyText.titleMedium(
                                    "Transaction history",
                                    fontWeight: 600,
                                    fontSize: 20,
                                  ),
                                ],
                              ),
                              source: controller.data!,
                              columns: const [
                                DataColumn(
                                    label: MyText.bodyMedium('Name',
                                        fontWeight: 600)),
                                DataColumn(
                                    label: MyText.bodyMedium('Type',
                                        fontWeight: 600)),
                                DataColumn(
                                    label: MyText.bodyMedium('Date',
                                        fontWeight: 600)),
                                DataColumn(
                                    label: MyText.bodyMedium('Status',
                                        fontWeight: 600)),
                                DataColumn(
                                    label: MyText.bodyMedium('Amount',
                                        fontWeight: 600)),
                              ],
                              columnSpacing: 150,
                              horizontalMargin: 50,
                              rowsPerPage: 10,
                              dataRowMaxHeight: 60,
                            ),
                        ],
                      )),
                  MyFlexItem(
                      sizes: 'lg-4',
                      child: MyContainer.bordered(
                        borderRadiusAll: 12,
                        paddingAll: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const MyText.bodyLarge("Your Balance",
                                fontWeight: 600),
                            buildCard(),
                            MySpacing.height(20),
                            buildAmount(
                              "Earning Amount",
                              "\$54,654,54",
                              '23%',
                              LucideIcons.trending_up,
                              contentTheme.info,
                            ),
                            MySpacing.height(20),
                            buildAmount(
                              "Selling Amount",
                              "\$12,321,12",
                              '-12%',
                              LucideIcons.trending_down,
                              contentTheme.danger,
                            ),
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

  Widget buildAmount(String name, String price, String percentage,
      IconData icon, Color color) {
    return MyContainer.bordered(
      width: double.infinity,
      height: 185,
      borderRadiusAll: 12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.titleMedium(name, fontWeight: 600),
          MyText.titleLarge(price, fontWeight: 700, letterSpacing: 2),
          Row(
            children: [
              MyContainer.rounded(
                paddingAll: 12,
                color: color.withAlpha(40),
                child: Icon(icon, size: 16, color: color),
              ),
              MySpacing.width(12),
              MyText.bodyLarge(percentage, fontWeight: 600),
            ],
          )
        ],
      ),
    );
  }

  Widget buildCard() {
    return MyContainer(
      paddingAll: 0,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          MyContainer(
            marginAll: 32,
            height: 250,
            borderRadiusAll: 12,
            color: contentTheme.danger.withAlpha(160),
          ),
          MyContainer(
            marginAll: 18,
            height: 247,
            borderRadiusAll: 12,
            color: contentTheme.danger,
          ),
          MyContainer(
            paddingAll: 0,
            height: 247,
            borderRadiusAll: 12,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: contentTheme.danger,
            child: Stack(
              children: [
                Positioned(
                  left: -60,
                  top: -100,
                  height: 200,
                  width: 200,
                  child: MyContainer.rounded(
                    height: 200,
                    color: contentTheme.light.withAlpha(100),
                  ),
                ),
                Positioned(
                  bottom: -100,
                  left: -80,
                  height: 200,
                  width: 400,
                  child: MyContainer(
                    borderRadius:
                        const BorderRadius.only(topRight: Radius.circular(100)),
                    color: contentTheme.light.withAlpha(100),
                  ),
                ),
                Positioned(
                  top: -100,
                  right: -150,
                  height: 200,
                  width: 400,
                  child: MyContainer(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(100)),
                    color: contentTheme.light.withAlpha(100),
                  ),
                ),
                MyContainer.transparent(
                  paddingAll: 20,
                  width: double.infinity,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  borderRadiusAll: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText.bodyLarge(
                                "Current Balance",
                                fontWeight: 600,
                                xMuted: true,
                              ),
                              MyText.titleLarge(
                                "\$ 78,984",
                                fontWeight: 700,
                                letterSpacing: 2,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Stack(
                                children: [
                                  MyContainer.rounded(
                                    color: contentTheme.light,
                                  ),
                                  Positioned(
                                    child: MyContainer.rounded(
                                      width: 70,
                                      color: contentTheme.red,
                                    ),
                                  ),
                                ],
                              ),
                              MySpacing.height(4),
                              Padding(
                                padding: MySpacing.right(20),
                                child: const MyText.bodySmall(
                                  'mastercard',
                                  fontWeight: 600,
                                  muted: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: MyText.titleLarge(
                              "8432 6594 6547",
                              fontWeight: 700,
                              letterSpacing: 2,
                              muted: true,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          MyText.bodyMedium(
                            "08/27",
                            fontWeight: 600,
                            muted: true,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyData extends DataTableSource with UIMixin {
  List<WalletData> walletData = [];

  MyData(this.walletData);

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => walletData.length;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    WalletData data = walletData[index];

    return DataRow(
      cells: [
        DataCell(MyText.bodySmall(
          data.assets,
        )),
        DataCell(MyText.bodySmall(
          data.type,
        )),
        DataCell(MyText.bodySmall(
          Utils.getDateStringFromDateTime(data.date),
        )),
        DataCell(MyText.bodySmall(
          data.status,
          color: data.status == 'Refund'
              ? contentTheme.primary
              : data.status == 'Paid'
                  ? contentTheme.success
                  : data.status == 'Cancel'
                      ? contentTheme.danger
                      : null,
          fontWeight: 600,
        )),
        DataCell(MyText.bodySmall(
          "\$${data.amount}",
        )),
      ],
    );
  }
}
