
// ignore_for_file: unnecessary_new
import 'package:agenna/app/modules/entery/controller/enter_controller.dart';
import 'package:agenna/app/routes/app_pages.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:agenna/app/modules/tab/controller/tab_controller.dart';
import 'package:agenna/app/services/settings_serv.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart';
class TabView extends GetView<TabsController>{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Obx((){
    return Scaffold(

      backgroundColor: Get.theme.scaffoldBackgroundColor,
        bottomNavigationBar:bottomnavbar(controller: controller,),
        appBar: AppBar(

         toolbarHeight: Get.height/10,
          backgroundColor: Get.theme.primaryColor,
          //expandedHeight: 280,
          elevation: 0,
          iconTheme: IconThemeData(color:  Get.theme.hintColor),
          title: Text(
            Get.find<SettingServ>().setting.value.appName!.tr,
            style:TextStyle(color: Get.theme.accentColor,fontSize: 25,fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [GestureDetector(onTap: (){
            Get.find<EnteryController>().countnote.value=0;
            Get.toNamed(Routes.NOTELIST);
          },
          child:
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child:Get.find<EnteryController>().countnote.value>0? Badge(

            position: BadgePosition.center(),
            alignment: Alignment.center,
            toAnimate: true,
            animationDuration: Duration(seconds: 1),
            badgeColor: Get.theme.accentColor ,
            badgeContent:Text(Get.find<EnteryController>().countnote.value.toString(),style: TextStyle(color: Colors.white),),
            child: Icon(Icons.notification_important,size: 40,color: Get.theme.hintColor,),
          ): Icon(Icons.notification_important,size: 40,color: Get.theme.hintColor,)
            ,)              ),



          ]
        ),
        body: controller.currentPage
    );});
  }

}

class bottomnavbar extends StatelessWidget {
  const bottomnavbar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TabsController controller;

  @override
  Widget build(BuildContext context) {
     return Obx((){
       return BottomNavyBar(
           animationDuration:Duration(milliseconds: 100),
           itemCornerRadius: 60,
           backgroundColor: Get.theme.primaryColor,
           selectedIndex: controller.currentIndex.value,
           items: <BottomNavyBarItem>[
             BottomNavyBarItem(
                 icon: Icon(Icons.home),
                 title: Text("Home".tr)
                 ,activeColor: Get.theme.accentColor,
                 inactiveColor: Colors.grey
             ),
        /*     BottomNavyBarItem(
                 icon: Icon(Icons.sticky_note_2_outlined),
                 title: Text("Reservation".tr)
                 ,activeColor: Get.theme.accentColor,
                 inactiveColor: Colors.grey
             )
             ,*/

             BottomNavyBarItem(
                 icon: Icon(Icons.local_hospital_outlined),
                 title: Text("Visiting".tr)
                 ,activeColor: Get.theme.accentColor,
                 inactiveColor: Colors.grey
             )
             ,
             BottomNavyBarItem(
                 icon: Icon(Icons.settings),
                 title: Text("Setting".tr)
                 ,activeColor: Get.theme.accentColor,
                 inactiveColor: Colors.grey
             )
           ],
           onItemSelected: (index){
             controller.currentIndex.value=index;
           });
     });
  }
}