import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/controller/ui/shop/shop_list_controller.dart';
import 'package:flutter_grocery_app/helpers/utils/ui_mixins.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_breadcrumb.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_breadcrumb_item.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_container.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_spacing.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_text.dart';
import 'package:flutter_grocery_app/helpers/widgets/responsive.dart';
import 'package:flutter_grocery_app/model/shop_data.dart';
import 'package:flutter_grocery_app/views/layout/layout.dart';
import 'package:get/get.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class ShopListScreen extends StatefulWidget {
  const ShopListScreen({super.key});

  @override
  State<ShopListScreen> createState() => _ShopListScreenState();
}

class _ShopListScreenState extends State<ShopListScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late ShopListController controller;

  @override
  void initState() {
    controller = Get.put(ShopListController());
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
                      "Shop List",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Admin'),
                        MyBreadcrumbItem(name: 'Shop List', active: true),
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
                  paddingAll: 20,
                  height: 810,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyContainer(
                        onTap: () => controller.gotoAddScreen(),
                        paddingAll: 8,
                        borderRadiusAll: 8,
                        color: contentTheme.primary,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              LucideIcons.plus,
                              size: 16,
                              color: contentTheme.onPrimary,
                            ),
                            MySpacing.width(8),
                            MyText.bodySmall(
                              "Add a new Shop",
                              color: contentTheme.onPrimary,
                            )
                          ],
                        ),
                      ),
                      MySpacing.height(20),
                      Expanded(
                        child: GridView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: controller.shop.length,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 400,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                  mainAxisExtent: 230),
                          itemBuilder: (context, index) {
                            ShopData data = controller.shop[index];
                            return MyContainer.bordered(
                              paddingAll: 20,
                              borderRadiusAll: 12,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      MyContainer.roundBordered(
                                        height: 80,
                                        width: 80,
                                        paddingAll: 0,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        child: Image.asset(data.image,
                                            fit: BoxFit.cover),
                                      ),
                                      MySpacing.width(20),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            MyText.bodyMedium(data.name,
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: 600),
                                            MySpacing.height(4),
                                            Row(
                                              children: [
                                                const Icon(LucideIcons.map_pin,
                                                    size: 14),
                                                MySpacing.width(8),
                                                Expanded(
                                                  child: MyText.bodySmall(
                                                    data.address,
                                                    fontWeight: 600,
                                                    xMuted: true,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(LucideIcons.mail, size: 16),
                                      MySpacing.width(8),
                                      Expanded(
                                        child: MyText.bodySmall(
                                          data.email,
                                          fontWeight: 600,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(LucideIcons.phone, size: 16),
                                      MySpacing.width(8),
                                      Expanded(
                                        child: MyText.bodySmall(
                                          data.phoneNumber,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: 600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  MyContainer(
                                    onTap: () => controller.gotoShopDetail(),
                                    color: contentTheme.primary,
                                    borderRadiusAll: 8,
                                    paddingAll: 8,
                                    child: MyText.labelMedium(
                                      "View Detail",
                                      color: contentTheme.onPrimary,
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
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
