// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:agenna/app/modules/auth/controller/auth_controller.dart';
import 'package:agenna/app/modules/entery/controller/enter_controller.dart';
import 'package:agenna/app/services/connectivity.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:agenna/app/modules/entery/binding/enter_binding.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';
import 'app/services/global_serv.dart';
import 'app/services/settings_serv.dart';
import 'app/services/translation_serv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
Future<void> _firebaseMessagingBackgroundHandler(message) async {
  Firebase.initializeApp();
  if(await box.hasData('token'))
    {
      Get.toNamed(Routes.NOTEFICATION,arguments: {'title':message.notification!.title.toString(),'body':message.notification!.body.toString(),'image':message.data['image'].toString()});

    }
   Get.toNamed(Routes.LOGIN);

}
/* flutter omoma tech project*/
final box=GetStorage();

initServices() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await GetStorage().initStorage;


  await Get.putAsync(() => TranslationServ().init());
  await Get.putAsync(() => GlobalServ().init());
  await Get.putAsync(() => SettingServ().init());
  Get.put(EnteryController());
  Get.put(ConnetivityController());



  FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
      badge: true
  );
  FirebaseMessaging.onMessage.listen((RemoteMessage message){
       Get.find<EnteryController>().countnote.value+=1;
  });
  FirebaseMessaging.onMessageOpenedApp.listen((message){

   Get.toNamed(Routes.NOTEFICATION,arguments: {'title':message.notification!.title.toString(),'body':message.notification!.body.toString(),'image':message.data['image'].toString()});
  } );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(GetMaterialApp(

    title: Get.find<SettingServ>().setting.value.appName!,
    initialRoute: AppPages.SECOND_ENTERY,
    getPages: AppPages.routes,
    initialBinding: EnteryBinding(),
    localizationsDelegates: [GlobalMaterialLocalizations.delegate,

    GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate
    ],
    supportedLocales: Get.find<TranslationServ>().supportedLocales(),
    translationsKeys: Get.find<TranslationServ>().translations,
    locale: Get.find<SettingServ>().getLocale(),
    fallbackLocale: Get.find<TranslationServ>().fallbackLocale,
    debugShowCheckedModeBanner: false,
    defaultTransition: Transition.cupertino,
    themeMode: Get.find<SettingServ>().getThemeMode(),
    theme: Get.find<SettingServ>().getLightTheme(),
    darkTheme: Get.find<SettingServ>().getDarkTheme(),
  ));

}



