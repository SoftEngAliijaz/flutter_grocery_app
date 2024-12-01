import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/controller/ui/grocery/grocery_detail_controller.dart';
import 'package:flutter_grocery_app/helpers/theme/app_style.dart';
import 'package:flutter_grocery_app/helpers/utils/ui_mixins.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_breadcrumb.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_breadcrumb_item.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_button.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_container.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_flex.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_flex_item.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_list_extension.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_spacing.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_star_rating.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_text.dart';
import 'package:flutter_grocery_app/helpers/widgets/responsive.dart';
import 'package:flutter_grocery_app/model/product_data.dart';
import 'package:flutter_grocery_app/views/layout/layout.dart';
import 'package:get/get.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class GroceryDetailScreen extends StatefulWidget {
  const GroceryDetailScreen({super.key});

  @override
  State<GroceryDetailScreen> createState() => _GroceryDetailScreenState();
}

class _GroceryDetailScreenState extends State<GroceryDetailScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late GroceryDetailController controller;

  @override
  void initState() {
    controller = Get.put(GroceryDetailController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        tag: 'grocery_detail_controller',
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium(
                      "Grocery Detail",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Admin'),
                        MyBreadcrumbItem(name: 'Grocery Detail', active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyFlex(
                      wrapAlignment: WrapAlignment.start,
                      wrapCrossAlignment: WrapCrossAlignment.start,
                      children: [
                        MyFlexItem(
                          sizes: "lg-4 md-12",
                          child: MyContainer.bordered(
                            borderRadiusAll: 12,
                            paddingAll: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                MyContainer(
                                  borderRadiusAll: 8,
                                  paddingAll: 0,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Image.asset(
                                    controller.selectedImage,
                                    fit: BoxFit.cover,
                                    height: 300,
                                  ),
                                ),
                                MySpacing.height(20),
                                Wrap(
                                    runAlignment: WrapAlignment.spaceAround,
                                    alignment: WrapAlignment.spaceAround,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    runSpacing: 12,
                                    spacing: 12,
                                    children: controller.images.mapIndexed(
                                      (index, image) {
                                        bool isSelected =
                                            image == controller.selectedImage;
                                        return MyContainer.bordered(
                                          onTap: () =>
                                              controller.onChangeImage(image),
                                          height: 100,
                                          paddingAll: 0,
                                          border: Border.all(
                                              color: isSelected
                                                  ? contentTheme.primary
                                                  : contentTheme.dark,
                                              width: isSelected ? 2 : .3),
                                          borderRadiusAll: 8,
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          child: Image.asset(image,
                                              fit: BoxFit.cover),
                                        );
                                      },
                                    ).toList()),
                              ],
                            ),
                          ),
                        ),
                        MyFlexItem(
                          sizes: "lg-8 md-12",
                          child: MyContainer.bordered(
                            borderRadiusAll: 12,
                            paddingAll: 20,
                            height: 458,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText.bodySmall("Grocery",
                                    fontSize: 12, color: contentTheme.primary),
                                MySpacing.height(12),
                                MyText.titleMedium("Coffee",
                                    fontWeight: 600,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis),
                                MySpacing.height(12),
                                Row(
                                  children: [
                                    MyStarRating(
                                        rating: 3,
                                        size: 16,
                                        inactiveColor: contentTheme.secondary,
                                        activeColor: AppColors.star),
                                    MySpacing.width(8),
                                    MyText.bodySmall("(485 Customer Reviews)",
                                        color: contentTheme.title),
                                  ],
                                ),
                                MySpacing.height(12),
                                Row(
                                  children: [
                                    MyText.titleLarge(
                                      "Price :",
                                      fontWeight: 600,
                                    ),
                                    MySpacing.width(8),
                                    MyText.titleLarge(
                                      "\$ 57.99",
                                      fontWeight: 600,
                                    )
                                  ],
                                ),
                                MySpacing.height(8),
                                MyText.titleSmall(
                                  "Description :",
                                  fontWeight: 600,
                                ),
                                MySpacing.height(8),
                                MyText.bodySmall(
                                  controller.dummyTexts[0],
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  muted: true,
                                ),
                                MySpacing.height(12),
                                MyText.titleMedium("Available Offer",
                                    fontWeight: 600),
                                MySpacing.height(12),
                                offerWidget(
                                    "Combo OfferBuy 3 items save 5%; Buy 4 save 7%; Buy 5+ save 10%"),
                                MySpacing.height(8),
                                offerWidget(
                                    "Combo OfferBuy 3 items save 3%; Buy 4 or more save 5%"),
                                MySpacing.height(8),
                                offerWidget(
                                    "Partner OfferMake a purchase and enjoy a surprise cashback/ coupon that you can redeem later!"),
                                MySpacing.height(8),
                                offerWidget(
                                    "Bank OfferExtra \$30 off on HDFC Bank Pixel Credit Card Transactions. Min Txn Value: \$200"),
                                MySpacing.height(12),
                                Row(
                                  children: [
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      borderColor: contentTheme.primary,
                                      backgroundColor:
                                          contentTheme.primary.withAlpha(32),
                                      splashColor:
                                          contentTheme.primary.withOpacity(0.2),
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.labelMedium(
                                        'Edit Detail',
                                        fontWeight: 600,
                                        color: contentTheme.primary,
                                      ),
                                    ),
                                    MySpacing.width(12),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      borderColor: contentTheme.danger,
                                      backgroundColor:
                                          contentTheme.danger.withAlpha(32),
                                      splashColor:
                                          contentTheme.danger.withOpacity(0.2),
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.bodySmall(
                                        'Delete Detail',
                                        fontWeight: 600,
                                        color: contentTheme.danger,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    MySpacing.height(flexSpacing),
                    Padding(
                      padding: MySpacing.x(flexSpacing / 2),
                      child: SizedBox(
                        height: 200,
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.products.length,
                          itemBuilder: (context, index) {
                            ProductData product = controller.products[index];
                            return MyContainer.bordered(
                              borderRadiusAll: 12,
                              width: 151,
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MyContainer(
                                      paddingAll: 0,
                                      borderRadiusAll: 12,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: Image.asset(product.image,
                                          height: 70,
                                          width: double.infinity,
                                          fit: BoxFit.cover)),
                                  MySpacing.height(12),
                                  MyText.titleMedium(product.name,
                                      fontWeight: 600),
                                  MySpacing.height(12),
                                  MyStarRating(
                                      rating: product.star,
                                      size: 16,
                                      inactiveColor: contentTheme.secondary,
                                      activeColor: AppColors.star),
                                  MySpacing.height(12),
                                  MyText.bodySmall("\$${product.price}.00",
                                      fontWeight: 600),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(width: 20);
                          },
                        ),
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

  Widget offerWidget(String description) {
    return Row(
      children: [
        Icon(LucideIcons.tag, size: 16, color: contentTheme.success),
        MySpacing.width(8),
        Expanded(
            child: MyText.bodySmall(description, fontWeight: 600, maxLines: 1))
      ],
    );
  }
}
