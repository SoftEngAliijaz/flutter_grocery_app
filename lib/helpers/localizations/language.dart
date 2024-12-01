import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/helpers/storage/local_storage.dart';
import 'package:flutter_grocery_app/helpers/theme/theme_customizer.dart';

class Language {
  final Locale locale;
  final bool supportRTL;
  final String languageName;

  static List<Language> languages = [
    Language(const Locale('en'), "English"),
    Language(const Locale('hi'), "हिंदी"),
    Language(const Locale('es'), "Español"),
    Language(
      const Locale('ar'),
      "عربي",
      true,
    ),
    Language(const Locale('fr'), "Français"),
  ];

  Language(this.locale, this.languageName, [this.supportRTL = false]);

  static Future<bool> init() async {
    ThemeCustomizer.instance.currentLanguage = await getLanguage();
    return true;
  }

  static List<Locale> getLocales() {
    return languages.map((e) => e.locale).toList();
  }

  static List<String> getLanguagesCodes() {
    return languages.map((e) => e.locale.languageCode).toList();
  }

  static Future<Language> getLanguage() async {
    Language? language;
    String? langCode = LocalStorage.getLanguage();
    language = findFromLocale(Locale(langCode!));

    return language ?? languages.first;
  }

  static Language getLanguageFromCode(String code) {
    Language selectedLang = languages.first;
    for (var language in languages) {
      if (language.locale.languageCode == code) selectedLang = language;
    }
    return selectedLang;
  }

  static Language? findFromLocale(Locale locale) {
    for (Language language in languages) {
      if (language.locale.languageCode == locale.languageCode) return language;
    }
    return null;
  }

  Language clone() {
    return Language(locale, languageName, supportRTL);
  }

  @override
  String toString() {
    return 'Language{locale: $locale, isRTL: $supportRTL, languageName: $languageName}';
  }
}
