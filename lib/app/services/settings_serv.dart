// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:agenna/app/models/setting_model.dart';
import 'package:agenna/app/repositories/setting_repository.dart';
import 'package:agenna/app/services/translation_serv.dart';
import 'package:agenna/app/widgets/ui_function.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingServ extends GetxService {
  final setting = Setting().obs;


  SettingRepos? _settingRepos;
  SettingServ() {
    _settingRepos = SettingRepos();
  }
  Future<SettingServ> init() async {

    setting.value = await _settingRepos!.get();
    return this;
  }

  ThemeData getLightTheme() {
    return ThemeData(
        primaryColor: UiFunction.parseColor("#eeedf2"),
        // ignore: prefer_const_constructors
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            elevation: 0, foregroundColor: Colors.white),
        brightness: Brightness.light,
        accentColor: UiFunction.parseColor(setting.value.mainColor!),
        dividerColor:
            UiFunction.parseColor(setting.value.accentColor!, opacity: 0.1),
        focusColor: UiFunction.parseColor(setting.value.accentColor!),
        hintColor: UiFunction.parseColor(setting.value.secondColor!),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              primary: UiFunction.parseColor(setting.value.mainColor!)),
        ),
        colorScheme: ColorScheme.light(
          primary: UiFunction.parseColor("#eeedf2"),
          secondary: UiFunction.parseColor("#eeedf2"),
        ),
        textTheme: GoogleFonts.getTextTheme(
          getLocale().toString().startsWith('ar') ? 'Cairo' : 'Poppins',
          TextTheme(
            headline6: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w700,
                color: UiFunction.parseColor(setting.value.mainColor!),
                height: 1.3),
            headline5: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: UiFunction.parseColor(setting.value.secondColor!),
                height: 1.3),
            headline4: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
                color: UiFunction.parseColor(setting.value.secondColor!),
                height: 1.3),
            headline3: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                color: UiFunction.parseColor(setting.value.secondColor!),
                height: 1.3),
            headline2: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
                color: UiFunction.parseColor(setting.value.mainColor!),
                height: 1.4),
            headline1: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w300,
                color: UiFunction.parseColor(setting.value.secondColor!),
                height: 1.4),
            subtitle2: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                color: UiFunction.parseColor(setting.value.secondColor!),
                height: 1.2),
            subtitle1: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w400,
                color: UiFunction.parseColor(setting.value.mainColor!),
                height: 1.2),
            bodyText2: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w600,
                color: UiFunction.parseColor(setting.value.secondColor!),
                height: 1.2),
            bodyText1: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: UiFunction.parseColor(setting.value.secondColor!),
                height: 1.2),
            caption: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w300,
                color: UiFunction.parseColor(setting.value.accentColor!),
                height: 1.2),
          ),
        ));
  }

  ThemeData getDarkTheme() {
    return ThemeData(
        primaryColor: Color(0xFF252525),
        floatingActionButtonTheme: FloatingActionButtonThemeData(elevation: 0),
        scaffoldBackgroundColor: Color(0xFF2C2C2C),
        brightness: Brightness.dark,
        accentColor: UiFunction.parseColor(setting.value.mainDarkColor!),
        dividerColor:
            UiFunction.parseColor(setting.value.accentDarkColor!, opacity: 0.1),
        focusColor: UiFunction.parseColor(setting.value.accentDarkColor!),
        hintColor: UiFunction.parseColor(setting.value.secondDarkColor!),
        toggleableActiveColor:
            UiFunction.parseColor(setting.value.mainDarkColor!),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              primary: UiFunction.parseColor(setting.value.mainColor!)),
        ),
        colorScheme: ColorScheme.dark(
          primary: UiFunction.parseColor(setting.value.mainDarkColor!),
          secondary: UiFunction.parseColor(setting.value.mainDarkColor!),
        ),
        textTheme: GoogleFonts.getTextTheme(
            getLocale().toString().startsWith('ar') ? 'Cairo' : 'Poppins',
            TextTheme(
              headline6: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700,
                  color: UiFunction.parseColor(setting.value.mainDarkColor!),
                  height: 1.3),
              headline5: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  color: UiFunction.parseColor(setting.value.secondDarkColor!),
                  height: 1.3),
              headline4: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                  color: UiFunction.parseColor(setting.value.secondDarkColor!),
                  height: 1.3),
              headline3: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: UiFunction.parseColor(setting.value.secondDarkColor!),
                  height: 1.3),
              headline2: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                  color: UiFunction.parseColor(setting.value.mainDarkColor!),
                  height: 1.4),
              headline1: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w300,
                  color: UiFunction.parseColor(setting.value.secondDarkColor!),
                  height: 1.4),
              subtitle2: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: UiFunction.parseColor(setting.value.secondDarkColor!),
                  height: 1.2),
              subtitle1: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w400,
                  color: UiFunction.parseColor(setting.value.mainDarkColor!),
                  height: 1.2),
              bodyText2: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w600,
                  color: UiFunction.parseColor(setting.value.secondDarkColor!),
                  height: 1.2),
              bodyText1: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: UiFunction.parseColor(setting.value.secondDarkColor!),
                  height: 1.2),
              caption: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w300,
                  color: UiFunction.parseColor(setting.value.accentDarkColor!),
                  height: 1.2),
            )));
  }

  Locale getLocale() {
    String? _locale = GetStorage().read<String>('language');
    if (_locale == null || _locale.isEmpty) {
      _locale = setting.value.mobileLanguage;
    }
    return Get.find<TranslationServ>().fromStringToLocale(_locale!);
  }

  ThemeMode getThemeMode() {
    String? _themeMode = GetStorage().read<String>('theme_mode');
    switch (_themeMode) {
      case 'ThemeMode.light':
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.light
              .copyWith(systemNavigationBarColor: Colors.white),
        );
        return ThemeMode.light;
      case 'ThemeMode.dark':
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.dark
              .copyWith(systemNavigationBarColor: Colors.black87),
        );
        return ThemeMode.dark;
      case 'ThemeMode.system':
        return ThemeMode.system;
      default:
        if (setting.value.defaultTheme == "dark") {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle.dark
                .copyWith(systemNavigationBarColor: Colors.black87),
          );
          return ThemeMode.dark;
        } else {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle.light
                .copyWith(systemNavigationBarColor: Colors.white),
          );
          return ThemeMode.light;
        }
    }
  }
}
