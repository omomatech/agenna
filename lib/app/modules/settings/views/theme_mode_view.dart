import 'package:agenna/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:agenna/app/widgets/ui_function.dart';


import '../controllers/theme_mode_controller.dart';

class ThemeModeView extends GetView<ThemeModeController> {
  final bool hideAppBar;

  ThemeModeView({this.hideAppBar = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: hideAppBar
            ? null
            : AppBar(
                title: Text(
                  "Theme Mode".tr,
                  style: context.textTheme.headline6,
                ),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                leading:  new IconButton(
                      icon: new Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
                      onPressed: () {
                        Get.toNamed(Routes.TAB);
                      }
                  )
               ,
                elevation: 0,
              ),
        body: ListView(
          primary: true,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: UiFunction.getBoxDecoration(),
              child: Column(
                children: [
                  RadioListTile(
                    value: ThemeMode.light,
                    groupValue: controller.selectedThemeMode.value,
                    onChanged: (dynamic value) {
                      controller.changeThemeMode(value);
                    },
                    title: Text("Light Theme".tr, style: Get.textTheme.bodyText2),
                  ),
                  RadioListTile(
                    value: ThemeMode.dark,
                    groupValue: controller.selectedThemeMode.value,
                    onChanged: (dynamic value) {
                      controller.changeThemeMode(value);
                    },
                    title: Text("Dark Theme".tr, style: Get.textTheme.bodyText2),
                  ),
                  RadioListTile(
                    value: ThemeMode.system,
                    groupValue: controller.selectedThemeMode.value,
                    onChanged: (dynamic value) {
                      controller.changeThemeMode(value);
                    },
                    title: Text("System Theme".tr, style: Get.textTheme.bodyText2),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
