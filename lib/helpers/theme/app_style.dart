import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/helpers/theme/admin_theme.dart';
import 'package:flutter_grocery_app/helpers/theme/theme_customizer.dart';
import 'package:flutter_grocery_app/helpers/widgets/my.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_breadcrumb_item.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_constant.dart';
import 'package:flutter_grocery_app/helpers/widgets/my_text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class MaterialRadius {
  MaterialRadius(
      {this.xs = 2, this.small = 4, this.medium = 6, this.large = 8});

  double xs, small, medium, large;
}

class ColorGroup {
  ColorGroup(this.color, this.onColor);

  final Color color, onColor;
}

class AppTheme {
  /// -------------------------- Dark Theme  -------------------------------------------- ///
  static final ThemeData darkTheme =
      ThemeData.dark(useMaterial3: false).copyWith(
    /// Brightness

    /// Scaffold and Background color
    scaffoldBackgroundColor: const Color(0xff262729),
    canvasColor: Colors.transparent,

    primaryColor: const Color(0xff527853),

    /// AppBar Theme
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xff262729)),

    /// Card Theme
    cardTheme: const CardTheme(color: Color(0xff1b1b1c)),
    cardColor: const Color(0xff1b1b1c),

    /// Colorscheme
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff527853),
      // seedColor: Color(0xff067070),
      surface: const Color(0xff262729),
      onSurface: const Color(0xFFD7D7D7),
      brightness: Brightness.dark,
    ),

    /// Input (Text-Field) Theme
    inputDecorationTheme: const InputDecorationTheme(),

    /// Divider Color
    dividerTheme:
        const DividerThemeData(color: Color(0xff393A41), thickness: 1),
    dividerColor: const Color(0xff393A41),

    /// Floating Action Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppTheme.primaryColor,
        splashColor: Colors.white.withAlpha(100),
        highlightElevation: 8,
        elevation: 4,
        focusColor: AppTheme.primaryColor,
        hoverColor: AppTheme.primaryColor,
        foregroundColor: Colors.white),

    /// Bottom AppBar Theme
    bottomAppBarTheme:
        const BottomAppBarTheme(color: Color(0xff464c52), elevation: 2),

    /// Tab bar Theme
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: const Color(0xff495057),
      labelColor: AppTheme.primaryColor,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: AppTheme.primaryColor, width: 2.0),
      ),
    ),

    /// Slider Theme
    sliderTheme: SliderThemeData(
      activeTrackColor: AppTheme.primaryColor,
      inactiveTrackColor: AppTheme.primaryColor.withAlpha(100),
      trackShape: const RoundedRectSliderTrackShape(),
      trackHeight: 4.0,
      thumbColor: AppTheme.primaryColor,
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
      tickMarkShape: const RoundSliderTickMarkShape(),
      inactiveTickMarkColor: Colors.red[100],
      valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
      valueIndicatorTextStyle: const TextStyle(
        color: Colors.white,
      ),
    ),

    ///Other Color
    indicatorColor: Colors.white,
    disabledColor: const Color(0xffa3a3a3),
    highlightColor: const Color(0xff47484b),
    splashColor: Colors.white.withAlpha(100),
  );

  /// -------------------------- Light Theme  -------------------------------------------- ///

  static final ThemeData lightTheme = ThemeData(
    /// Brightness
    brightness: Brightness.light,
    useMaterial3: false,

    /// Primary Color
    primaryColor: AppTheme.primaryColor,

    /// Scaffold and Background color
    scaffoldBackgroundColor: const Color(0xffF5F5F5),
    canvasColor: Colors.transparent,

    /// AppBar Theme
    appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xffF5F5F5),
        iconTheme: IconThemeData(color: Color(0xff495057)),
        actionsIconTheme: IconThemeData(color: Color(0xff495057))),

    /// Card Theme
    cardTheme: const CardTheme(color: Color(0xffffffff)),
    cardColor: const Color(0xffffffff),

    /// Colorscheme
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff527853),
      // seedColor: Color(0xff2e87a6),
      brightness: Brightness.light,
    ),

    snackBarTheme: const SnackBarThemeData(actionTextColor: Colors.white),

    /// Floating Action Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppTheme.primaryColor,
        splashColor: const Color(0xffeeeeee).withAlpha(100),
        highlightElevation: 8,
        elevation: 4,
        focusColor: AppTheme.primaryColor,
        hoverColor: AppTheme.primaryColor,
        foregroundColor: const Color(0xffeeeeee)),

    /// Divider Theme
    dividerTheme:
        const DividerThemeData(color: Color(0xffdddddd), thickness: 1),
    dividerColor: const Color(0xffdddddd),

    /// Bottom AppBar Theme
    bottomAppBarTheme:
        const BottomAppBarTheme(color: Color(0xffeeeeee), elevation: 2),

    /// Tab bar Theme
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: const Color(0xff495057),
      labelColor: AppTheme.primaryColor,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: AppTheme.primaryColor, width: 2.0),
      ),
    ),

    inputDecorationTheme: const InputDecorationTheme(),

    /// Slider Theme
    sliderTheme: SliderThemeData(
      activeTrackColor: AppTheme.primaryColor,
      inactiveTrackColor: AppTheme.primaryColor.withAlpha(140),
      trackShape: const RoundedRectSliderTrackShape(),
      trackHeight: 4.0,
      thumbColor: AppTheme.primaryColor,
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
      tickMarkShape: const RoundSliderTickMarkShape(),
      inactiveTickMarkColor: Colors.red[100],
      valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
      valueIndicatorTextStyle: const TextStyle(
        color: Color(0xffeeeeee),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
      checkColor: WidgetStateProperty.all(const Color(0xffffffff)),
      fillColor: WidgetStateProperty.all(AppTheme.primaryColor),
    ),
    switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) =>
            states.contains(WidgetState.selected)
                ? AppTheme.primaryColor
                : Colors.white)),

    /// Other Colors
    splashColor: Colors.white.withAlpha(100),
    indicatorColor: const Color(0xffeeeeee),
    highlightColor: const Color(0xffeeeeee),
  );

  static Color primaryColor = const Color(0xff527853);
  static TextDirection textDirection = TextDirection.ltr;
  static ThemeData theme = AppTheme.getThemeFromThemeMode();

  // static Color primaryColor = Color(0xff006784);

  static ThemeData getThemeFromThemeMode() {
    return ThemeCustomizer.instance.theme == ThemeMode.light
        ? lightTheme
        : darkTheme;
  }

  static ThemeData createTheme(ThemeMode themeType, Color seedColor) {
    if (themeType == ThemeMode.light) {
      return lightTheme.copyWith(
          colorScheme: ColorScheme.fromSeed(
              seedColor: seedColor, brightness: Brightness.light));
    }
    return darkTheme.copyWith(
        colorScheme: ColorScheme.fromSeed(
            seedColor: seedColor,
            brightness: Brightness.dark,
            onSurface: const Color(0xFFDAD9CA)));
  }
}

class AppStyle {
  /// -------------------------- Styles  -------------------------------------------- ///

  static MaterialRadius buttonRadius =
      MaterialRadius(small: 2, medium: 4, large: 8);

  static MaterialRadius cardRadius =
      MaterialRadius(xs: 2, small: 4, medium: 4, large: 8);

  static MaterialRadius containerRadius =
      MaterialRadius(xs: 2, small: 4, medium: 4, large: 8);

  static MaterialRadius imageRadius =
      MaterialRadius(xs: 2, small: 4, medium: 4, large: 8);

  static void init() {
    initMyStyle();
    AdminTheme.setTheme();
  }

  static void changeMyTheme() {
    My.changeTheme(AppTheme.theme);
  }

  static void initMyStyle() {
    MyTextStyle.resetFontStyles();
    MyTextStyle.changeFontFamily(GoogleFonts.poppins);
    My.changeTheme(AppTheme.theme);
    My.setConstant(MyConstantData(
      containerRadius: AppStyle.containerRadius.medium,
      cardRadius: AppStyle.cardRadius.medium,
      buttonRadius: AppStyle.buttonRadius.medium,
      defaultBreadCrumbItem:
          MyBreadcrumbItem(name: 'flutter_grocery_app', route: '/dashboard'),
    ));
    bool isMobile = true;
    try {
      isMobile = Platform.isAndroid || Platform.isIOS;
    } catch (_) {
      isMobile = false;
    }
    My.setFlexSpacing(isMobile ? 16 : 24);
  }
}

class AppColors {
  AppColors() {
    list.addAll(
      [
        pink,
        violet,
        blue,
        green,
        orange,
      ],
    );
  }

  static ColorGroup blue =
      ColorGroup(const Color(0xffADD8FF), const Color(0xff004A8F));

  static ColorGroup blueViolet =
      ColorGroup(const Color(0xffC5C6E7), const Color(0xff3B3E91));

  static ColorGroup favorite = rubinRed;
  static ColorGroup green =
      ColorGroup(const Color(0xffAFE9DA), const Color(0xff165041));

  static ColorGroup lavender =
      ColorGroup(const Color(0xffEAE2F3), const Color(0xff7748AD));

  // static Color notificationErrorActionColor = Color(0xff006784);

  static List<ColorGroup> list = [
    redOrange,
    violet,
    blue,
    green,
    orange,
    skyBlue,
    lavender,
    blueViolet
  ];

  static Color notificationErrorActionColor = const Color(0xffffac1c);
  static Color notificationErrorBGColor = const Color(0xfffcd9df);
  static Color notificationErrorTextColor = const Color(0xffFF3B0A);
  static Color notificationSuccessActionColor = const Color(0xffFFE815);
  static Color notificationSuccessBGColor = const Color(0xff117E68);
  static Color notificationSuccessTextColor = const Color(0xffffffff);
  static ColorGroup orange =
      ColorGroup(const Color(0xffFFCEC2), const Color(0xffFF3B0A));

  static ColorGroup pink =
      ColorGroup(const Color(0xffFFC2D9), const Color(0xffF5005E));

  static ColorGroup queenPink =
      ColorGroup(const Color(0xffE8D9DC), const Color(0xff804D57));

  static Color ratingStarColor = const Color(0xFFF9A825);
  static ColorGroup redOrange =
      ColorGroup(const Color(0xffFFAD99), const Color(0xffF53100));

  static ColorGroup rosePink =
      ColorGroup(const Color(0xffFCB1E0), const Color(0xffEC0999));

  static ColorGroup rubinRed =
      ColorGroup(const Color(0x98f6a8bd), const Color(0xffd03760));

  static ColorGroup skyBlue =
      ColorGroup(const Color(0xffC2F0FF), const Color(0xff0099CC));

  static const Color star = Color(0xffFFC233);
  static Color success = const Color(0xff1abc9c);
  static ColorGroup violet =
      ColorGroup(const Color(0xffD0BADE), const Color(0xff4E2E60));

  static ColorGroup get random => list[Random().nextInt(list.length)];

  static ColorGroup get(int index) {
    return list[index % list.length];
  }

  static Color getColorByRating(int rating) {
    var colors = {
      1: const Color(0xfff0323c),
      2: const Color(0xcdf0323c),
      3: star,
      4: const Color(0xcd3cd278),
      5: const Color(0xff3cd278)
    };

    return colors[rating] ?? colors[1]!;
  }
}
