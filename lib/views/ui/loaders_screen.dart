import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/controller/ui/loaders_controller.dart';
import 'package:flutter_grocery_app/helpers/theme/app_themes.dart';
import 'package:flutter_grocery_app/helpers/utils/ui_mixins.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_breadcrumb.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_breadcrumb_item.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_container.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_flex.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_flex_item.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_spacing.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_text.dart';
import 'package:flutter_grocery_app/helpers/widgets/responsive.dart';
import 'package:flutter_grocery_app/views/layout/layout.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadersScreen extends StatefulWidget {
  const LoadersScreen({super.key});

  @override
  State<LoadersScreen> createState() => _LoadersScreenState();
}

class _LoadersScreenState extends State<LoadersScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late LoadersController controller;

  @override
  void initState() {
    controller = LoadersController();
    super.initState();
  }

  Widget horizontalRotatingLoader() {
    return MyContainer.bordered(
      height: 150,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadiusAll: 12,
      paddingAll: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const MyText.titleMedium("Horizontal Rotating Loader",
              fontWeight: 600),
          LoadingAnimationWidget.horizontalRotatingDots(
              size: 40, color: contentTheme.primary),
        ],
      ),
    );
  }

  Widget flickrLoader() {
    return MyContainer.bordered(
      height: 150,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadiusAll: 12,
      paddingAll: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const MyText.titleMedium("Flickr Loader", fontWeight: 600),
          LoadingAnimationWidget.flickr(
              size: 40,
              leftDotColor: contentTheme.secondary,
              rightDotColor: contentTheme.primary),
        ],
      ),
    );
  }

  Widget dotsTriangleLoader() {
    return MyContainer.bordered(
      height: 150,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadiusAll: 12,
      paddingAll: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const MyText.titleMedium("DotsTriangle Loader", fontWeight: 600),
          LoadingAnimationWidget.dotsTriangle(
              color: contentTheme.primary, size: 40),
        ],
      ),
    );
  }

  Widget halfTriangleDotLoader() {
    return MyContainer.bordered(
      height: 150,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadiusAll: 12,
      paddingAll: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const MyText.titleMedium("Half TriangleDot Loader", fontWeight: 600),
          LoadingAnimationWidget.halfTriangleDot(
              color: contentTheme.primary, size: 40),
        ],
      ),
    );
  }

  Widget stretchedDotsLoader() {
    return MyContainer.bordered(
      height: 150,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadiusAll: 12,
      paddingAll: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const MyText.titleMedium("StretchedDots Loader", fontWeight: 600),
          LoadingAnimationWidget.stretchedDots(
              color: contentTheme.primary, size: 40),
        ],
      ),
    );
  }

  Widget newtonCradleLoader() {
    return MyContainer.bordered(
      height: 150,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadiusAll: 12,
      paddingAll: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const MyText.titleMedium("NewtonCradle Loader", fontWeight: 600),
          LoadingAnimationWidget.newtonCradle(
              color: contentTheme.primary, size: 40),
        ],
      ),
    );
  }

  Widget twoRotatingArcLoader() {
    return MyContainer.bordered(
      height: 150,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadiusAll: 12,
      paddingAll: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const MyText.titleMedium("Two RotatingArc Loader", fontWeight: 600),
          LoadingAnimationWidget.twoRotatingArc(
              color: contentTheme.primary, size: 40),
        ],
      ),
    );
  }

  Widget beatLoader() {
    return MyContainer.bordered(
      height: 150,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadiusAll: 12,
      paddingAll: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const MyText.titleMedium("Beat Loader", fontWeight: 600),
          LoadingAnimationWidget.beat(color: contentTheme.primary, size: 40),
        ],
      ),
    );
  }

  Widget hexagonDotsLoader() {
    return MyContainer.bordered(
      height: 150,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadiusAll: 12,
      paddingAll: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const MyText.titleMedium("Hexagon Dots Loader", fontWeight: 600),
          LoadingAnimationWidget.hexagonDots(
              color: contentTheme.primary, size: 40),
        ],
      ),
    );
  }

  Widget bouncingBallLoader() {
    return MyContainer.bordered(
      height: 150,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadiusAll: 12,
      paddingAll: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const MyText.titleMedium("Bouncing Ball Loader", fontWeight: 600),
          LoadingAnimationWidget.bouncingBall(
              color: contentTheme.primary, size: 40),
        ],
      ),
    );
  }

  Widget threeArchedCircleLoader() {
    return MyContainer.bordered(
      height: 150,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadiusAll: 12,
      paddingAll: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const MyText.titleMedium("Three Arched Circle Loader",
              fontWeight: 600),
          LoadingAnimationWidget.threeArchedCircle(
              color: contentTheme.primary, size: 40),
        ],
      ),
    );
  }

  Widget discreteCircularLoader() {
    return MyContainer.bordered(
      height: 150,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadiusAll: 12,
      paddingAll: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const MyText.titleMedium("Discrete Circular Loader", fontWeight: 600),
          LoadingAnimationWidget.discreteCircle(
              color: contentTheme.primary, size: 40),
        ],
      ),
    );
  }

  Widget progressiveDotsLoader() {
    return MyContainer.bordered(
      height: 150,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadiusAll: 12,
      paddingAll: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const MyText.titleMedium("Progressive Dots Loader", fontWeight: 600),
          LoadingAnimationWidget.progressiveDots(
              color: contentTheme.primary, size: 40),
        ],
      ),
    );
  }

  Widget fallingDotsLoader() {
    return MyContainer.bordered(
      height: 150,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadiusAll: 12,
      paddingAll: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const MyText.titleMedium("Falling Dots Loader", fontWeight: 600),
          LoadingAnimationWidget.fallingDot(
              color: contentTheme.primary, size: 40),
        ],
      ),
    );
  }

  Widget fourRotatingDotsLoader() {
    return MyContainer.bordered(
      height: 150,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadiusAll: 12,
      paddingAll: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const MyText.titleMedium("Four Rotating Dots Loader",
              fontWeight: 600),
          LoadingAnimationWidget.fourRotatingDots(
              color: contentTheme.primary, size: 40),
        ],
      ),
    );
  }

  Widget staggeredDotsLoader() {
    return MyContainer.bordered(
      height: 150,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadiusAll: 12,
      paddingAll: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const MyText.titleMedium("staggered Dots Loader", fontWeight: 600),
          LoadingAnimationWidget.staggeredDotsWave(
              color: contentTheme.primary, size: 40),
        ],
      ),
    );
  }

  Widget threeRotatingDotsLoader() {
    return MyContainer.bordered(
      height: 150,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadiusAll: 12,
      paddingAll: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const MyText.titleMedium("ThreeRotating Dots Loader",
              fontWeight: 600),
          LoadingAnimationWidget.threeRotatingDots(
              color: contentTheme.primary, size: 40),
        ],
      ),
    );
  }

  Widget twistingDotsLoader() {
    return MyContainer.bordered(
      height: 150,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadiusAll: 12,
      paddingAll: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const MyText.titleMedium("Twisting Dots Loader", fontWeight: 600),
          LoadingAnimationWidget.twistingDots(
              rightDotColor: contentTheme.primary,
              leftDotColor: contentTheme.secondary,
              size: 40),
        ],
      ),
    );
  }

  Widget simpleLoader() {
    return const MyContainer.bordered(
      height: 150,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadiusAll: 12,
      paddingAll: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("Simple Loader", fontWeight: 600),
          CircularProgressIndicator(),
        ],
      ),
    );
  }

  Widget waveDotsLoader() {
    return MyContainer.bordered(
      height: 150,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadiusAll: 12,
      paddingAll: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const MyText.titleMedium("WaveDots Loader", fontWeight: 600),
          LoadingAnimationWidget.waveDots(
              color: theme.colorScheme.primary, size: 40),
        ],
      ),
    );
  }

  Widget inkDropLoader() {
    return MyContainer.bordered(
      height: 150,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadiusAll: 12,
      paddingAll: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const MyText.titleMedium("Ink Drop Loader", fontWeight: 600),
          LoadingAnimationWidget.inkDrop(
              color: theme.colorScheme.primary, size: 40),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        tag: 'loaders_controller',
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const MyText.titleMedium(
                      "Loader",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Widgets'),
                        MyBreadcrumbItem(name: 'Loader', active: true),
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
                    MyFlexItem(sizes: 'lg-3 md-6', child: simpleLoader()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: waveDotsLoader()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: inkDropLoader()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: twistingDotsLoader()),
                    MyFlexItem(
                        sizes: 'lg-3 md-6', child: threeRotatingDotsLoader()),
                    MyFlexItem(
                        sizes: 'lg-3 md-6', child: staggeredDotsLoader()),
                    MyFlexItem(
                        sizes: 'lg-3 md-6', child: fourRotatingDotsLoader()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: fallingDotsLoader()),
                    MyFlexItem(
                        sizes: 'lg-3 md-6', child: progressiveDotsLoader()),
                    MyFlexItem(
                        sizes: 'lg-3 md-6', child: discreteCircularLoader()),
                    MyFlexItem(
                        sizes: 'lg-3 md-6', child: threeArchedCircleLoader()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: bouncingBallLoader()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: flickrLoader()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: hexagonDotsLoader()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: beatLoader()),
                    MyFlexItem(
                        sizes: 'lg-3 md-6', child: twoRotatingArcLoader()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: newtonCradleLoader()),
                    MyFlexItem(
                        sizes: 'lg-3 md-6', child: stretchedDotsLoader()),
                    MyFlexItem(
                        sizes: 'lg-3 md-6', child: halfTriangleDotLoader()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: dotsTriangleLoader()),
                    MyFlexItem(
                        sizes: 'lg-3 md-6', child: horizontalRotatingLoader()),
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
