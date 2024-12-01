import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/helpers/localizations/language.dart';
import 'package:flutter_grocery_app/helpers/theme/app_notifire.dart';
import 'package:provider/provider.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate {
  const AppLocalizationsDelegate(this.context);

  final BuildContext context;

  @override
  bool isSupported(Locale locale) =>
      Language.getLanguagesCodes().contains(locale.languageCode);

  @override
  Future load(Locale locale) => _load(locale);

  @override
  bool shouldReload(LocalizationsDelegate old) => false;

  Future _load(Locale locale) async {
    Provider.of<AppNotifier>(context, listen: false)
        .changeLanguage(Language.getLanguageFromCode(locale.languageCode));
    return;
  }
}
