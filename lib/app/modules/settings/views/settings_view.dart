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


          SettingsList(

            backgroundColor: Get.theme.scaffoldBackgroundColor,
          sections: [
          SettingsSection(

          title: 'General'.tr,
            tiles: [
              SettingsTile(
                title: 'Language'.tr,

                leading: Icon(Icons.language),
                onPressed: (context){Get.toNamed(Routes.SETTINGS_LANGUAGE);},
              ),
              SettingsTile(
                title: 'Theme Mode'.tr,

                leading: Icon(Icons.dark_mode),
                onPressed: (context){Get.toNamed(Routes.SETTINGS_THEME_MODE);},
              ),



            ],
          ),
              SettingsSection(
                title: 'Feedback'.tr,
                tiles: [
                  SettingsTile(
                    title: 'Send Feedback'.tr,
                    leading: Icon(Icons.feedback),
                    onPressed: (context){},
                  ),
                  SettingsTile(
                    title: 'Report Error'.tr,

                    leading: Icon(Icons.error),
                    onPressed: (context){},
                  ),



                ],
              ),

              SettingsSection(
                title: 'Contact us'.tr,
                tiles: [
                  SettingsTile(
                    title: 'Faccebook'.tr,
                    leading: Icon(Icons.facebook),

                  ),



                ],
              ),
              SettingsSection(
                title: 'Account'.tr,
                tiles: [

                  SettingsTile(
                    title: 'Logout'.tr,
                    leading: Icon(Icons.logout),
                    onPressed: (value){

                       controller.logoutfunc();

                    },
                  ),


                ],
              ),


              ])

          ));








  }







}
