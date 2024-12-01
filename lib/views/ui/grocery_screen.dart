import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/controller/ui/grocery_controller.dart';
import 'package:flutter_grocery_app/helpers/theme/app_style.dart';
import 'package:flutter_grocery_app/helpers/theme/app_themes.dart';
import 'package:flutter_grocery_app/helpers/utils/ui_mixins.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_breadcrumb.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_breadcrumb_item.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_container.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_flex.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_flex_item.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_spacing.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_star_rating.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_text.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_text_style.dart';
import 'package:flutter_grocery_app/helpers/widgets/responsive.dart';
import 'package:flutter_grocery_app/model/product_data.dart';
import 'package:flutter_grocery_app/views/layout/layout.dart';
import 'package:get/get.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class GroceryScreen extends StatefulWidget {
  const GroceryScreen({super.key});

  @override
  State<GroceryScreen> createState() => _GroceryScreenState();
}

class _GroceryScreenState extends State<GroceryScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late GroceryController controller;

  @override
  void initState() {
    controller = Get.put(GroceryController());
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
                      "Foods",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Foods', active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: MyFlex(children: [
                  MyFlexItem(sizes: 'lg-3', child: priceRange()),
                  MyFlexItem(sizes: 'lg-9', child: productGrid()),
                ]),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget priceRange() {
    return MyContainer.bordered(
      borderRadiusAll: 12,
      paddingAll: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: MySpacing.xy(12, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.bodyMedium("Range Price", fontWeight: 600),
                MySpacing.height(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.bodyLarge(
                      "\$${controller.rangeSlider.start.toString()}",
                      fontWeight: 600,
                    ),
                    MyText.bodyLarge(
                      "\$${controller.rangeSlider.end.toString()}",
                      fontWeight: 600,
                    ),
                  ],
                ),
                RangeSlider(
                  min: 10,
                  max: 100,
                  divisions: 10,
                  labels: RangeLabels(
                      controller.rangeSlider.start.floor().toString(),
                      controller.rangeSlider.end.floor().toString()),
                  values: controller.rangeSlider,
                  onChanged: controller.onChangeRangeSlider,
                  activeColor: theme.sliderTheme.activeTrackColor,
                  inactiveColor: theme.sliderTheme.inactiveTrackColor,
                ),
              ],
            ),
          ),
          Divider(height: 0),
          Padding(
            padding: MySpacing.xy(12, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.bodyMedium(
                  "Categories",
                  fontWeight: 600,
                ),
                MySpacing.height(12),
                Column(
                  children: List.generate(
                    controller.checkListItems.length,
                    (index) => CheckboxListTile(
                      fillColor: WidgetStateProperty.resolveWith((states) {
                        if (!states.contains(WidgetState.selected)) {
                          return contentTheme.onDark;
                        }
                        return null;
                      }),
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      title: MyText.bodySmall(
                        controller.checkListItems[index]['title'],
                        fontWeight: 600,
                      ),
                      value: controller.checkListItems[index]["value"],
                      onChanged: (value) => controller.toggleSelection(index),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget productGrid() {
    return MyContainer.bordered(
      borderRadiusAll: 12,
      paddingAll: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  isDense: true,
                  isCollapsed: true,
                  filled: true,
                  hintText: "Search by product name",
                  hintStyle: MyTextStyle.bodyMedium(),
                  prefixIcon: Icon(LucideIcons.search, size: 20),
                  contentPadding: MySpacing.all(16)),
            ),
          ),
          MySpacing.height(20),
          GridView.builder(
            shrinkWrap: true,
            primary: true,
            itemCount: controller.products.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                mainAxisExtent: 203),
            itemBuilder: (context, index) {
              ProductData product = controller.products[index];
              return StarLike(productData: product);
            },
          )
        ],
      ),
    );
  }
}

class StarLike extends StatefulWidget {
  final ProductData productData;

  const StarLike({super.key, required this.productData});

  @override
  State<StarLike> createState() => _StarLikeState();
}

class _StarLikeState extends State<StarLike> with UIMixin {
  late ProductData productData;
  bool isLiked = false;

  @override
  void initState() {
    productData = widget.productData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyContainer.bordered(
      borderRadiusAll: 12,
      paddingAll: 20,
      onTap: viewDetailScreen,
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  productData.image,
                  fit: BoxFit.cover,
                  height: 100,
                  width: 100,
                ),
              ),
              MySpacing.width(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText.titleMedium(
                    productData.name,
                    fontWeight: 600,
                  ),
                  MySpacing.height(12),
                  MyText.bodySmall(
                    "\$${productData.price}.00",
                    fontWeight: 600,
                  ),
                  MySpacing.height(12),
                  MyStarRating(
                    rating: productData.star,
                    inactiveColor: contentTheme.secondary,
                    activeColor: AppColors.star,
                  ),
                ],
              ),
            ],
          ),
          MySpacing.height(20),
          Row(
            children: [
              MyContainer(
                onTap: addToCart,
                paddingAll: 8,
                borderRadiusAll: 8,
                color: contentTheme.primary,
                child: MyText.labelMedium(
                  "Add To cart",
                  color: contentTheme.onPrimary,
                  fontWeight: 600,
                ),
              ),
              MySpacing.width(12),
              IconButton(
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  visualDensity: VisualDensity.compact,
                  icon: Icon(!isLiked ? Icons.favorite_outline : Icons.favorite,
                      size: 20, color: contentTheme.primary))
            ],
          ),
        ],
      ),
    );
  }

  void addToCart() {
    Get.toNamed('/cart');
  }

  void viewDetailScreen() {
    Get.toNamed('/admin/grocery/detail');
  }
}
