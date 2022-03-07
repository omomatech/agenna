// ignore_for_file: prefer_const_constructors
import 'package:agenna/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_pages.dart';

class NotificationsButtonWidget extends GetWidget<HomeController> {
  NotificationsButtonWidget({

    Key? key,
  }) : super(key: key);


  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {

          Get.toNamed(Routes.HOME);

      },
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: <Widget>[
          Icon(
            Icons.notifications_outlined,
            color: Get.theme.accentColor,
            size: 30,
          ),
          Container(
            child: Center(
              child: SizedBox()
            ),
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            constraints: BoxConstraints(
                minWidth: 15, maxWidth: 15, minHeight: 15, maxHeight: 15),
          ),
        ],
      ),
      color: Colors.transparent,
    );
  }
}
