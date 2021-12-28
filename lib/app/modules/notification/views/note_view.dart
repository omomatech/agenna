import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:agenna/app/modules/notification/controllers/note_controller.dart';
import 'package:agenna/app/routes/app_pages.dart';
import 'package:progressive_image/progressive_image.dart';
class NoteFicationView extends GetView<NoteFicationController> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

           body: SafeArea(child: SingleChildScrollView(
             scrollDirection: Axis.vertical,
             child:Column(children: [
               Card(
                 semanticContainer: true,
                 clipBehavior: Clip.antiAliasWithSaveLayer,
                 child: ProgressiveImage(

                   repeat: ImageRepeat.noRepeat,
                   fit: BoxFit.cover,
                   placeholder: AssetImage("asset/img/home.png"),
                   // size: 1.87KB
                   thumbnail: AssetImage("asset/img/home.png"),
                   // size: 1.29MB
                   image:CachedNetworkImageProvider(controller.urlimage.toString()+controller.image.value.toString()),
                   height: Get.width-10,
                   width: Get.height-10,
                 ),
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10.0),
                 ),
                 elevation: 5,
                 margin: EdgeInsets.all(10),
               ),//
               // Image of the card
                Container(
                 padding: EdgeInsets.only(right: 10,left:10),
                  margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                 child: Column(children: [

                   new Text(
                     controller.title.value.toString(),textAlign: TextAlign.right,style: TextStyle(

                       fontSize: 22,fontWeight: FontWeight.bold),),
                   SizedBox(height: 6,),
                   new Text(
                   controller.body.value.toString(),textAlign: TextAlign.right,style: TextStyle(

                     fontSize: 20,fontWeight: FontWeight.normal),),],)
                ),

             ],) ,
           ),)
    );
  }
}
