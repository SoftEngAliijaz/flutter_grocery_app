import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_grocery_app/controller/ui/dashboard_controller.dart';
import 'package:flutter_grocery_app/controller/ui/shop/shop_detail_controller.dart';
import 'package:flutter_grocery_app/helpers/utils/ui_mixins.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_breadcrumb.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_breadcrumb_item.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_container.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_flex.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_flex_item.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_list_extension.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_spacing.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_text.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_text_style.dart';
import 'package:flutter_grocery_app/helpers/widgets/responsive.dart';
import 'package:flutter_grocery_app/views/layout/layout.dart';
import 'package:intl/intl.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:ui' as ui;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with UIMixin {
  DashboardController controller = Get.put(DashboardController());

  @override
  void initState() {
    _initializeVariables();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium(
                      "Dashboard",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Admin'),
                        MyBreadcrumbItem(name: 'Dashboard', active: true),
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
                        child: stats(LucideIcons.cup_soda, contentTheme.primary,
                            "47", "Total Menus")),
                    MyFlexItem(
                        sizes: 'lg-3 md-6',
                        child: stats(LucideIcons.dollar_sign, contentTheme.info,
                            "12k", "Total Revenue")),
                    MyFlexItem(
                        sizes: 'lg-3 md-6',
                        child: stats(LucideIcons.container,
                            contentTheme.warning, "20", "Total Orders")),
                    MyFlexItem(
                        sizes: 'lg-3 md-6',
                        child: stats(LucideIcons.users, contentTheme.success,
                            "47", "Total Client")),
                    MyFlexItem(sizes: 'lg-8 md-6', child: revenueChart()),
                    MyFlexItem(
                      sizes: 'lg-4 md-6',
                      child: MyContainer.bordered(
                        borderRadiusAll: 12,
                        paddingAll: 20,
                        child: SizedBox(
                            height: 344, child: _buildDefaultPieChart()),
                      ),
                    ),
                    MyFlexItem(child: trendingOrder()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: totalEarning()),
                    MyFlexItem(sizes: 'lg-9 md-6', child: orderReport()),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget stats(IconData icon, Color color, String title, String subTitle) {
    return MyContainer.bordered(
      paddingAll: 20,
      borderRadiusAll: 12,
      child: Row(
        children: [
          MyContainer.roundBordered(
            paddingAll: 28,
            borderColor: color,
            color: color.withAlpha(32),
            child: Icon(icon, size: 32, color: color),
          ),
          MySpacing.width(20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.displaySmall(title,
                    fontWeight: 600, overflow: TextOverflow.ellipsis),
                MyText.bodyMedium(subTitle,
                    fontWeight: 600, overflow: TextOverflow.ellipsis),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget revenueChart() {
    return MyContainer.bordered(
      borderRadiusAll: 12,
      paddingAll: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.titleMedium("Revenue", fontWeight: 600),
          MySpacing.height(20),
          SfCartesianChart(
            margin: EdgeInsets.zero,
            primaryXAxis: CategoryAxis(),
            tooltipBehavior: controller.chart,
            axes: <ChartAxis>[
              NumericAxis(
                  numberFormat: NumberFormat.compact(),
                  majorGridLines: const MajorGridLines(width: 0),
                  opposedPosition: true,
                  name: 'yAxis1',
                  interval: 1000,
                  minimum: 0,
                  maximum: 7000)
            ],
            series: [
              ColumnSeries<ChartSampleData, String>(
                  color: contentTheme.primary,
                  animationDuration: 2000,
                  dataSource: controller.chartData,
                  xValueMapper: (ChartSampleData data, _) => data.x,
                  yValueMapper: (ChartSampleData data, _) => data.y,
                  name: 'Unit Sold'),
              LineSeries<ChartSampleData, String>(
                  animationDuration: 4500,
                  animationDelay: 2000,
                  dataSource: controller.chartData,
                  xValueMapper: (ChartSampleData data, _) => data.x,
                  yValueMapper: (ChartSampleData data, _) => data.yValue,
                  yAxisName: 'yAxis1',
                  markerSettings: const MarkerSettings(isVisible: true),
                  name: 'Total Transaction')
            ],
          ),
        ],
      ),
    );
  }

  SfCircularChart _buildDefaultPieChart() {
    return SfCircularChart(
      onCreateShader: (ChartShaderDetails chartShaderDetails) {
        if (controller.shaderType == 'linear') {
          return ui.Gradient.linear(
              chartShaderDetails.outerRect.topRight,
              chartShaderDetails.outerRect.centerLeft,
              controller.colors,
              controller.stops);
        } else if (controller.shaderType == 'radial') {
          return ui.Gradient.radial(
              chartShaderDetails.outerRect.center,
              chartShaderDetails.outerRect.right -
                  chartShaderDetails.outerRect.center.dx,
              controller.colors,
              controller.stops);
        } else {
          return ui.Gradient.sweep(
              chartShaderDetails.outerRect.center,
              controller.colors,
              controller.stops,
              TileMode.clamp,
              _degreeToRadian(0),
              _degreeToRadian(360),
              _resolveTransform(
                  chartShaderDetails.outerRect, TextDirection.LTR));
        }
      },
      title:
          ChartTitle(text: 'Sales by Shop', textStyle: MyTextStyle.bodySmall()),
      legend: Legend(
        isVisible: true,
        position: LegendPosition.bottom,
        isResponsive: true,
        overflowMode: LegendItemOverflowMode.wrap,
        textStyle: MyTextStyle.bodySmall(),
      ),
      series: _getDefaultPieSeries(),
    );
  }

  void _initializeVariables() {
    controller.colors = const <Color>[
      Color.fromRGBO(96, 87, 234, 1),
      Color.fromRGBO(59, 141, 236, 1),
      Color.fromRGBO(112, 198, 129, 1),
      Color.fromRGBO(237, 241, 81, 1)
    ];
    controller.stops = <double>[0.25, 0.5, 0.75, 1];
    controller.shaderType = 'sweep';
  }

  List<PieSeries<ChartSampleData, String>> _getDefaultPieSeries() {
    final List<ChartSampleData> pieData = <ChartSampleData>[
      ChartSampleData(
          x: 'Take It Cheesy', y: 17, text: 'Take It Cheesy \n 17%'),
      ChartSampleData(x: 'Wingman’s Pub', y: 20, text: 'Wingman’s Pub \n 20%'),
      ChartSampleData(
          x: 'Lettuce Eat Bistro ', y: 25, text: 'Lettuce Eat Bistro  \n 25%'),
      ChartSampleData(
          x: 'Haute Dog Diner', y: 38, text: 'Haute Dog Diner \n 38%')
    ];
    return <PieSeries<ChartSampleData, String>>[
      PieSeries<ChartSampleData, String>(
          dataSource: pieData,
          explodeAll: true,
          explodeOffset: '8%',
          explode: true,
          strokeColor: Theme.of(context).brightness == Brightness.light
              ? Colors.black.withOpacity(0.3)
              : Colors.white.withOpacity(0.3),
          strokeWidth: 1.5,
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            textStyle: MyTextStyle.bodySmall(),
          ),
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          dataLabelMapper: (ChartSampleData data, _) => data.text),
    ];
  }

  dynamic _resolveTransform(Rect bounds, TextDirection textDirection) {
    final GradientTransform transform = GradientRotation(_degreeToRadian(-90));
    return transform.transform(bounds)!.storage;
  }

  double _degreeToRadian(int deg) => deg * (3.141592653589793 / 180);

  Widget trendingOrder() {
    return MyContainer.bordered(
      paddingAll: 20,
      borderRadiusAll: 12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.titleMedium("Trending Order", fontWeight: 600),
          MySpacing.height(20),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: controller.trendingOrder
                .map((order) => MyContainer.bordered(
                      onTap: () => controller.viewDetails(),
                      width: 350,
                      paddingAll: 20,
                      borderRadiusAll: 12,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyContainer(
                            paddingAll: 0,
                            borderRadiusAll: 12,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            height: 200,
                            width: 300,
                            child:
                                Image.asset(order['image'], fit: BoxFit.cover),
                          ),
                          MySpacing.height(12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText.titleMedium(order['name']),
                                  MyText.bodySmall("Order ${order['orders']}"),
                                ],
                              ),
                              MySpacing.height(8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  MyText.titleMedium(order['price']),
                                  MyText.bodySmall("Income ${order['income']}"),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }

  Widget orderReport() {
    return MyContainer.bordered(
      borderRadiusAll: 12,
      paddingAll: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText.titleMedium("Order Report", fontWeight: 600),
              MyContainer(
                onTap: () {},
                paddingAll: 6,
                color: contentTheme.primary.withAlpha(32),
                child: MyText.labelMedium("View all",
                    color: contentTheme.primary, fontWeight: 600),
              )
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: MyContainer.none(
              borderRadiusAll: 4,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: DataTable(
                  sortAscending: true,
                  onSelectAll: (_) => {},
                  dataRowMaxHeight: 60,
                  showBottomBorder: false,
                  showCheckboxColumn: true,
                  columnSpacing: 200,
                  columns: [
                    DataColumn(
                        label: MyText.labelLarge('Name', fontWeight: 600)),
                    DataColumn(
                        label: MyText.labelLarge('Order No', fontWeight: 600)),
                    DataColumn(
                        label:
                            MyText.labelLarge('Transaction', fontWeight: 600)),
                    DataColumn(
                        label: MyText.labelLarge('Delivery Status',
                            fontWeight: 600)),
                  ],
                  rows: controller.ordersDetail
                      .mapIndexed(
                        (index, data) => DataRow(
                          cells: [
                            DataCell(
                                MyText.bodyMedium(data.name, fontWeight: 600)),
                            DataCell(MyText.bodyMedium("# ${data.orderNo}",
                                fontWeight: 600)),
                            DataCell(MyText.bodyMedium(data.transaction,
                                fontWeight: 600)),
                            DataCell(MyContainer(
                              padding: MySpacing.xy(12, 4),
                              color: data.deliveryStatus == "On The Way"
                                  ? contentTheme.primary.withAlpha(36)
                                  : data.deliveryStatus == "Delivered"
                                      ? contentTheme.success.withAlpha(36)
                                      : data.deliveryStatus == "Pending"
                                          ? contentTheme.danger.withAlpha(36)
                                          : null,
                              child: MyText.bodyMedium(
                                data.deliveryStatus,
                                color: data.deliveryStatus == "On The Way"
                                    ? contentTheme.primary
                                    : data.deliveryStatus == "Delivered"
                                        ? contentTheme.success
                                        : data.deliveryStatus == "Pending"
                                            ? contentTheme.danger
                                            : null,
                                fontWeight: 600,
                              ),
                            )),
                          ],
                        ),
                      )
                      .toList()),
            ),
          ),
        ],
      ),
    );
  }

  Widget totalEarning() {
    return MyContainer.bordered(
      paddingAll: 20,
      borderRadiusAll: 12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.titleMedium("Total Earning", fontWeight: 600),
          MySpacing.height(20),
          MyContainer.bordered(
            paddingAll: 20,
            borderRadiusAll: 12,
            height: 131,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(LucideIcons.star),
                MyText.titleMedium("\$5,533"),
                MyText.titleMedium("Today"),
              ],
            ),
          ),
          MySpacing.height(20),
          MyContainer.bordered(
            paddingAll: 20,
            borderRadiusAll: 12,
            height: 131,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(LucideIcons.landmark),
                MyText.titleMedium("\$3,369"),
                MyText.titleMedium("Yesterday"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
