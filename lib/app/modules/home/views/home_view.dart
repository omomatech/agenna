// ignore_for_file: unnecessary_new

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:agenna/app/routes/app_pages.dart';
import 'package:agenna/app/widgets/block_button_widget.dart';
import '../../../modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:intl/intl.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

      return  RefreshIndicator(

          color: Colors.blueAccent,

          onRefresh: () async {
            print("rrrrrrrrrrrrrrrrrrrrrrrrrrrr");
            controller.refreshHome(showMessage: false);
          },

          child: buildSingleChildScrollView()
      );

  }

  SingleChildScrollView buildSingleChildScrollView() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      padding: EdgeInsets.all(10),
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            height: Get.height - (Get.height * .6),
            width: Get.width,
            child: Padding(
              padding: EdgeInsets.only(bottom: 25.0),
              child: Image.asset(
                "asset/img/home.png",

              ),
            ),
          ),
          Container(
              height: Get.height - (Get.height * .95),
              width: Get.width - (Get.width * .20),
              child: Text(
                "Last Visiting ".tr,
                style: Get.textTheme.caption!
                    .merge(TextStyle(color:  Get.theme.accentColor,fontWeight: FontWeight.w600,fontSize: 20)),

              )),

          Obx((){ return Container(
                  padding: EdgeInsets.all(10),
                  height: Get.height - (Get.height * .7),
                  width: Get.width,
                  child: Container(
                    height: 270,
                    width: Get.width,
                    child:controller.isloading.value==false?  Container(
                      width: 292,
                      margin: EdgeInsetsDirectional.only(end: 20, start: 20),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white24,
                          boxShadow: [
                            BoxShadow(
                                color: Get.theme.accentColor.withOpacity(.2),
                                blurRadius: 10,
                                offset: Offset(0, 5)),
                          ],
                          border: Border.all(
                              color: Get.theme.accentColor.withOpacity(0.5))),
                      child:controller.visiting.length>0? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[

                          // Image of the card
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [  Stack(
                                fit: StackFit.loose,
                                alignment: AlignmentDirectional.bottomStart,
                                children: <Widget>[
                                  Container(

                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 0),
                                    decoration: BoxDecoration(

                                        borderRadius: BorderRadius.circular(24)),
                                    child: Text(

                                      "Day : ".tr+DateFormat('EEEE').format(DateTime.parse(controller.visiting.value.elementAt(0).updated!.toString())).tr,
                                      style: Get.textTheme.caption!
                                          .merge(TextStyle(color: Get.theme.hintColor,fontWeight: FontWeight.bold,fontSize: 20)),
                                    ),
                                    width: Get.width*2/3,
                                  ),

                                ],
                              ),
                                Stack(
                                  fit: StackFit.loose,
                                  alignment: AlignmentDirectional.bottomStart,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 3),
                                      decoration: BoxDecoration(

                                          borderRadius: BorderRadius.circular(24)),
                                      child: Text(
                                        "Date : ".tr+
                                            DateFormat('d').format(DateTime.parse(controller.visiting.value.elementAt(0).updated!.toString())).tr+"  "+DateFormat('MMM').format(DateTime.parse(controller.visiting.value.elementAt(0).updated!.toString())).tr+" , "+DateFormat('yyyy').format(DateTime.parse(controller.visiting.value.elementAt(0).updated!.toString())).tr,
                                        style: Get.textTheme.caption!
                                            .merge(TextStyle(color: Get.theme.hintColor,fontWeight: FontWeight.bold,fontSize: 15)),
                                      ),
                                    ),

                                  ],
                                ),],),


                              Stack(

                                fit: StackFit.loose,
                                alignment: AlignmentDirectional.topEnd,
                                children: [
                                    Container(

                                      padding: EdgeInsets.symmetric(horizontal: 5),
                                      width: Get.width/3,
                                      child:  BlockButtonWidget(
                                          color: Get.theme.accentColor,
                                          text: Text(
                                            'Show Visit'.tr,
                                            style: Get.textTheme.button!
                                                .merge(TextStyle(color: Colors.white)),),
                                          onPressed: () {

                                            Get.toNamed(Routes.DISPLAYVISTING, arguments: [
                                              {"token":controller.usertoken.toString()},
                                              {"uuid":controller.visiting.value.elementAt(0).unique_id.toString()}]);

                                          }),
                                    ),

                              ],)
                        ],
                      ):Container(child: Image.asset("asset/img/empty.png",fit: BoxFit.cover,),)
                    ):Center(child: CircularProgressIndicator(color: Colors.blue,),)
                  ));})
        ],///////////////////////////////////////////////////////////
      ),
    );
  }
}
