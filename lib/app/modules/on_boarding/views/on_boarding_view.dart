// ignore_for_file: use_key_in_widget_const

import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:agenna/app/modules/on_boarding/controller/onboarding_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:agenna/app/routes/app_pages.dart';


class OnBoardingView extends GetView<OnBoardingController> {

  final pages = [
    PageModel(

        color: Get.theme.accentColor,
        imageAssetPath: 'asset/img/home.png',
        title: 'Welcome in agenna clinic'.tr,
        body: 'Specialized in providing medical services on the basis of the latest scientific findings'.tr,

        doAnimateImage: true),
    PageModel(
        color: Get.theme.accentColor,
        imageAssetPath: "asset/img/home.png",
        title: 'In agenna clinic'.tr,
        body: 'We grow and satisfy our customers is our goal and we consider ourselves pioneers in medicine'.tr,
        doAnimateImage: true),
    PageModel(
        color: Get.theme.accentColor,
        imageAssetPath:"asset/img/home.png",
        title: 'And you will see'.tr,
        body: 'We work in harmony to present a symphony of medicine in different specialties and we adhere to the highest international medical standards to advance the health and safety of the citizen'.tr,
        doAnimateImage: true),

  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:OverBoard(
        finishText: 'Login'.tr,

        pages: pages,

        nextText: "Next".tr,
        skipText: "Skip".tr,
        showBullets: true,
        skipCallback: (){
          Get.offAndToNamed(Routes.LOGIN);

        },
        finishCallback: (){
          Get.offAndToNamed(Routes.LOGIN);

        },
      )
    );
  }
}

