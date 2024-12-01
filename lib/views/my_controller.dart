import 'package:get/get.dart';
import 'package:flutter_grocery_app/helpers/theme/theme_customizer.dart';

abstract class MyController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    ThemeCustomizer.addListener((old, newVal) {
      if (old.theme != newVal.theme ||
          (old.currentLanguage.languageName !=
              newVal.currentLanguage.languageName)) {
        update();
        onThemeChanged();
      }
    });
  }

  void onThemeChanged() {}
}
