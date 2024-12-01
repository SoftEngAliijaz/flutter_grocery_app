import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_grocery_app/controller/home_controller.dart';
import 'package:flutter_grocery_app/helpers/utils/ui_mixins.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_breadcrumb.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_breadcrumb_item.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_button.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_container.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_flex.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_flex_item.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_spacing.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_text.dart';
import 'package:flutter_grocery_app/helpers/widgets/responsive.dart';
import 'package:flutter_grocery_app/constants/images.dart';
import 'package:flutter_grocery_app/views/layout/layout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with UIMixin {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        tag: 'home_controller',
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const MyText.titleMedium(
                      "Home",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Home', active: true),
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
                    MyFlexItem(sizes: 'lg-3', child: counterPoster()),
                    MyFlexItem(sizes: 'lg-9', child: categories()),
                    MyFlexItem(child: poster()),
                    MyFlexItem(child: nearByShop()),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget counterPoster() {
    return MyContainer.bordered(
      paddingAll: 20,
      borderRadiusAll: 12,
      height: 435,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: MyContainer.none(
                height: 200,
                child: Image.asset(Images.counter, fit: BoxFit.cover)),
          ),
          MySpacing.height(12),
          const MyText.titleLarge(
              "Daily Grocery Shopping Made Easy with Fast Delivery",
              fontWeight: 600,
              muted: true,
              maxLines: 2),
          MySpacing.height(20),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              FilledButton(
                  onPressed: controller.goToShopScreen,
                  child: MyText.labelMedium("Add Order",
                      color: contentTheme.onPrimary)),
              FilledButton.tonal(
                  onPressed: controller.orderStatus,
                  child: MyText.labelMedium("Order Status",
                      color: contentTheme.primary)),
            ],
          )
        ],
      ),
    );
  }

  Widget categories() {
    return GridView.builder(
      itemCount: controller.categoryList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisExtent: 207,
        maxCrossAxisExtent: 300,
        childAspectRatio: 0.7,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        dynamic grocery = controller.categoryList[index];
        return MyContainer.bordered(
          paddingAll: 20,
          borderRadiusAll: 12,
          onTap: controller.goToGroceryDetail,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    grocery['image'],
                    height: 130,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )),
              MySpacing.height(8),
              MyText.bodyMedium(grocery['name'], fontWeight: 600)
            ],
          ),
        );
      },
    );
  }

  Widget poster() {
    return MyFlex(
      contentPadding: false,
      children: [
        MyFlexItem(
            sizes: 'lg-4 sm-12',
            child: MyContainer(
              borderRadiusAll: 12,
              height: 160,
              paddingAll: 0,
              color: contentTheme.warning.withAlpha(32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: MySpacing.nRight(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const MyText.titleMedium(
                              "Everyday Fresh & Clean with Our Products",
                              fontWeight: 600,
                              maxLines: 2),
                          MySpacing.height(20),
                          MyButton(
                              borderRadiusAll: 12,
                              elevation: 0,
                              onPressed: controller.goToShopScreen,
                              child: MyText.bodyMedium("Shop Now",
                                  fontWeight: 600,
                                  color: contentTheme.onPrimary)),
                        ],
                      ),
                    ),
                  ),
                  MyContainer(
                    color: Colors.transparent,
                    child: Image.asset(
                      Images.poster[2],
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            )),
        MyFlexItem(
            sizes: 'lg-4 sm-12',
            child: MyContainer(
              borderRadiusAll: 12,
              height: 160,
              paddingAll: 0,
              color: contentTheme.danger.withAlpha(32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: MySpacing.nRight(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const MyText.titleMedium(
                              "Make your Breakfast Healthy and Easy",
                              fontWeight: 600,
                              maxLines: 2),
                          MySpacing.height(20),
                          MyButton(
                              borderRadiusAll: 12,
                              elevation: 0,
                              onPressed: controller.goToShopScreen,
                              child: MyText.bodyMedium("Shop Now",
                                  fontWeight: 600,
                                  color: contentTheme.onPrimary)),
                        ],
                      ),
                    ),
                  ),
                  MyContainer(
                    color: Colors.transparent,
                    child: Image.asset(
                      Images.poster[0],
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            )),
        MyFlexItem(
            sizes: 'lg-4 sm-12',
            child: MyContainer(
              borderRadiusAll: 12,
              paddingAll: 0,
              height: 160,
              color: contentTheme.primary.withAlpha(32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: MySpacing.nRight(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const MyText.titleMedium(
                              "The best Organic Products Online",
                              fontWeight: 600,
                              maxLines: 2),
                          MySpacing.height(20),
                          MyButton(
                              borderRadiusAll: 12,
                              elevation: 0,
                              onPressed: controller.goToShopScreen,
                              child: MyText.bodyMedium("Shop Now",
                                  fontWeight: 600,
                                  color: contentTheme.onPrimary)),
                        ],
                      ),
                    ),
                  ),
                  MyContainer(
                    color: Colors.transparent,
                    child: Image.asset(
                      Images.poster[1],
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ))
      ],
    );
  }

  Widget nearByShop() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MyText.titleMedium("Near by shop", fontWeight: 600),
        MySpacing.height(20),
        GridView.builder(
          itemCount: controller.nearByShop.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisExtent: 130,
            maxCrossAxisExtent: 600,
            childAspectRatio: 0.7,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            dynamic shop = controller.nearByShop[index];
            return MyContainer.bordered(
              onTap: controller.goToShopDetailScreen,
              borderRadiusAll: 12,
              paddingAll: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText.bodyMedium("Name: ${shop['name']}",
                            fontWeight: 600, overflow: TextOverflow.ellipsis),
                        MyText.bodyMedium("Address: ${shop['address']}",
                            fontWeight: 600, overflow: TextOverflow.ellipsis),
                        MyText.bodyMedium("Phone: ${shop['phone']}",
                            fontWeight: 600, overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                  MyContainer.bordered(
                    paddingAll: 8,
                    borderRadiusAll: 12,
                    child: MyText.labelSmall(shop['type'], fontWeight: 600),
                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
