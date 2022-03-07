import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:agenna/app/modules/settings/controllers/language_controller.dart';
import 'package:agenna/app/routes/app_pages.dart';
import 'package:settings_ui/settings_ui.dart';

import '../controllers/settings_controller.dart';


class SettingsView extends GetView<SettingsController> {



  @override
  Widget build(BuildContext context) {
    return Container(

        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SafeArea(
            bottom: true,
            top: true,
            child:


            GestureDetector(onTap: ()=>controller.logoutfunc(),child:const Text("logout"),)

        ));








  }







}
