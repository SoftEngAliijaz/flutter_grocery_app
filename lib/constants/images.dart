import 'dart:math';

class Images {
  /// WebApps Logo ///
  static String logoIcon = 'assets/logo/logo.png';

  /// Background ///
  static String background = 'assets/dummy/background.png';

  /// Auth Side Image ///
  static String authSideImage = 'assets/dummy/auth_side_background.png';

  static String counter = 'assets/dummy/counter.png';

  /// Avatars ///
  static List<String> avatars =
      List.generate(10, (index) => 'assets/avatar/${index + 1}.png');

  static List<String> poster =
      List.generate(3, (index) => 'assets/dummy/poster_${index + 1}.png');

  static List<String> dummy =
      List.generate(3, (index) => 'assets/dummy/dummy_${index + 1}.png');

  static List<String> shopLogo =
      List.generate(3, (index) => 'assets/dummy/shop/shop_${index + 1}.png');

  static String randomImage(List<String> images) {
    return images[Random().nextInt(images.length)];
  }
}
