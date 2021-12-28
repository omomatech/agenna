import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:agenna/app/modules/home/controllers/home_controller.dart';
import 'package:agenna/app/modules/visiting/controller/visiting_controller.dart';
import 'package:agenna/app/routes/app_pages.dart';
import 'package:agenna/app/widgets/block_button_widget.dart';
class VisitingView extends GetView<HomeController>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx((){
          return RefreshIndicator(
              onRefresh: () async {

                Get.find<HomeController>().refreshHome();
              },

              child:controller.visiting.length==0 ?ListView(
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                children: [Container(child: Image.asset("asset/img/empty.png",fit: BoxFit.cover,),)],):controller.isloading.value==true?Container(child:Center(child:CircularProgressIndicator(color:Colors.blue,),)):Container(
                // Use ListView.builder
                child:ListView.builder(physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  // the number of items in the list
                    itemCount: controller.visiting.value.length,

                    // display each item of the product list
                    itemBuilder: (context, index) {
                      return Container(
                          padding: EdgeInsets.all(10),
                          height: Get.height - (Get.height * .7),
                          width: Get.width,
                          child: Container(
                            height: 270,
                            width: Get.width,
                            child: Container(
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
                              child: Column(
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

                                            "Day : ".tr+DateFormat('EEEE').format(DateTime.parse(controller.visiting.value.elementAt(index).updated!.toString())).tr,
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
                                                  DateFormat('d').format(DateTime.parse(controller.visiting.value.elementAt(index).updated!.toString())).tr+"  "+DateFormat('MMM').format(DateTime.parse(controller.visiting.value.elementAt(index).updated!.toString())).tr+" , "+DateFormat('yyyy').format(DateTime.parse(controller.visiting.value.elementAt(index).updated!.toString())).tr,
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
                                        child: BlockButtonWidget(
                                            color: Get.theme.accentColor,
                                            text: Text(
                                              'Show Visit'.tr,
                                              style: Get.textTheme.button!
                                                  .merge(TextStyle(color: Colors.white)),),
                                            onPressed: () {
                                              Get.toNamed(Routes.DISPLAYVISTING, arguments: [
                                                {"token":controller.usertoken.toString()},
                                                {"uuid":controller.visiting.value.elementAt(index).unique_id.toString()}]);

                                            }),
                                      ),

                                    ],)
                                ],
                              ),
                            ),
                          ));
                    })
              )
          );
        });
  }
}