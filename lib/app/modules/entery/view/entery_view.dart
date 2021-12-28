
import 'package:agenna/app/modules/auth/views/auth_login_views.dart';
import 'package:agenna/app/modules/entery/controller/enter_controller.dart';

import 'package:agenna/app/modules/on_boarding/views/on_boarding_view.dart';
import 'package:agenna/app/routes/app_pages.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:get_storage/get_storage.dart';

class EnteryView extends GetView<EnteryController>{

  @override
  Widget build(BuildContext context) {

    return
      EasySplashScreen(

        durationInSeconds: 5,
        logo: Image.asset('asset/img/enter.gif',width: Get.width,),
        backgroundColor: Colors.white,
        showLoader: false,
      futureNavigator:Get.find<EnteryController>().first.value.toString()=='no'?Future.delayed(Duration(seconds: 5), ()async {
         return AuthLoginView();
      }):Future.delayed(Duration(seconds: 5), () {
        return OnBoardingView();
      }),
      logoSize: 130,
      );

  }
}


