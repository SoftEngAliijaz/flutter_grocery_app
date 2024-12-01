import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:get/get.dart';
import 'package:flutter_grocery_app/controller/auth/reset_password_controller.dart';
import 'package:flutter_grocery_app/helpers/theme/app_themes.dart';
import 'package:flutter_grocery_app/helpers/utils/ui_mixins.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_button.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_flex.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_flex_item.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_responsiv.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_screen_media_type.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_spacing.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_text.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_text_style.dart';
import 'package:flutter_grocery_app/constants/images.dart';
import 'package:flutter_grocery_app/views/layout/auth_layout.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen>
    with UIMixin {
  late ResetPasswordController controller;

  @override
  void initState() {
    controller = Get.put(ResetPasswordController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: GetBuilder(
        init: controller,
        tag: 'reset_password_controller',
        builder: (controller) {
          return MyFlex(
            contentPadding: false,
            runAlignment: WrapAlignment.center,
            wrapCrossAlignment: WrapCrossAlignment.center,
            wrapAlignment: WrapAlignment.center,
            children: [
              MyFlexItem(
                sizes: "lg-6",
                child: MyResponsive(
                  builder: (_, __, type) {
                    return type == MyScreenMediaType.xxl
                        ? buildAuthSideBar()
                        : type == MyScreenMediaType.xl
                            ? buildAuthSideBar()
                            : type == MyScreenMediaType.lg
                                ? buildAuthSideBar()
                                : const SizedBox();
                  },
                ),
              ),
              MyFlexItem(
                  sizes: 'lg-6',
                  child: Padding(
                    padding: MySpacing.only(left: 50, right: 65),
                    child: Form(
                      key: controller.basicValidator.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child: MyText.displaySmall("Reset Password",
                                  fontWeight: 600)),
                          MySpacing.height(20),
                          MyText.bodyMedium("Password", fontWeight: 700),
                          MySpacing.height(8),
                          TextFormField(
                            validator: controller.basicValidator
                                .getValidation('password'),
                            controller: controller.basicValidator
                                .getController('password'),
                            decoration: InputDecoration(
                                labelText: "Password",
                                labelStyle: MyTextStyle.bodySmall(xMuted: true),
                                border: outlineInputBorder,
                                suffixIcon: InkWell(
                                  onTap: () =>
                                      controller.onChangeShowPassword(),
                                  child: Icon(
                                      controller.showPassword
                                          ? LucideIcons.eye_off
                                          : LucideIcons.eye,
                                      size: 20),
                                ),
                                contentPadding: MySpacing.all(16),
                                isCollapsed: true,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never),
                            obscureText: controller.showPassword,
                          ),
                          MySpacing.height(20),
                          MyText.bodyMedium("Confirm Password",
                              fontWeight: 700),
                          MySpacing.height(8),
                          TextFormField(
                            validator: controller.basicValidator
                                .getValidation('confirm_password'),
                            controller: controller.basicValidator
                                .getController('confirm_password'),
                            decoration: InputDecoration(
                                labelText: "Confirm Password",
                                labelStyle: MyTextStyle.bodySmall(xMuted: true),
                                border: outlineInputBorder,
                                suffixIcon: InkWell(
                                  onTap: () => controller.onConfirmPassword(),
                                  child: Icon(
                                      controller.confirmPassword
                                          ? LucideIcons.eye_off
                                          : LucideIcons.eye,
                                      size: 20),
                                ),
                                contentPadding: MySpacing.all(16),
                                isCollapsed: true,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never),
                            obscureText: controller.confirmPassword,
                          ),
                          MySpacing.height(20),
                          Center(
                            child: MyButton.rounded(
                              onPressed: controller.onResetPassword,
                              elevation: 0,
                              padding: MySpacing.xy(20, 16),
                              backgroundColor: contentTheme.primary,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  controller.loading
                                      ? SizedBox(
                                          height: 14,
                                          width: 14,
                                          child: CircularProgressIndicator(
                                            color: theme.colorScheme.onPrimary,
                                            strokeWidth: 1.2,
                                          ),
                                        )
                                      : Container(),
                                  if (controller.loading) MySpacing.width(16),
                                  MyText.bodySmall(
                                    'Reset Password',
                                    color: contentTheme.onPrimary,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          );
        },
      ),
    );
  }

  Widget buildAuthSideBar() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 700,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage(Images.authSideImage),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            blendMode: BlendMode.darken,
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
            ),
          ),
        ),
        SizedBox(
          height: 700,
          width: 400,
          child: Center(
            child: MyText.displayMedium(
              "${controller.greeting} Welcome",
              textAlign: TextAlign.center,
              color: contentTheme.light,
            ),
          ),
        ),
      ],
    );
  }
}
