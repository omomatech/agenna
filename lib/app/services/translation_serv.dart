// ignore_for_file: prefer_const_constructors, prefer_collection_literals, avoid_function_literals_in_foreach_calls

import 'package:flutter/cupertino.dart';
import 'package:agenna/app/helper/helper_function.dart';
import 'package:get/get.dart';

class TranslationServ extends GetxService {
  final translations = Map<String, Map<String, String>>().obs;
  // fallbackLocale saves the day when the locale gets in trouble
  final fallbackLocale = Locale('en', 'US');

  // must add language codes here
  static final languages = [
    'en_US',
    'ar_EG',
  ];

  // initialize the translation service by loading the assets/locales folder
  // the assets/locales folder must contains file for each language that named
  // with the code of language concatenate with the country code
  // for agenna (en_US.json)
  Future<TranslationServ> init() async {
    languages.forEach((lang) async {
      // ignore: unnecessary_brace_in_string_interps
      var _file = await HelperFunction.getJsonFile('asset/locales/$lang.json');
      translations.putIfAbsent(lang, () => Map<String, String>.from(_file));
    });
    return this;
  }

  // get list of supported local in the application
  List<Locale> supportedLocales() {
    return TranslationServ.languages.map((_locale) {
      return fromStringToLocale(_locale);
    }).toList();
  }

  // Convert string code to local object
  Locale fromStringToLocale(String _locale) {
    if (_locale.contains('_')) {
      // en_US
      return Locale(
          _locale.split('_').elementAt(0), _locale.split('_').elementAt(1));
    } else {
      // en
      return Locale(_locale);
    }
  }
}
