import 'package:agenna/app/modules/notification/controllers/note_list_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:agenna/app/modules/notification/controllers/note_controller.dart';
import 'package:agenna/app/routes/app_pages.dart';
import 'package:intl/intl.dart';
import 'package:progressive_image/progressive_image.dart';
class NoteFicationListView extends GetView<NoteListController> {


  @override
  Widget build(BuildContext context) {
    return Obx((){return Scaffold(

        appBar: AppBar(centerTitle: true,title: Text("notetifcation".tr,style: TextStyle(color:Get.theme.accentColor),),leading: IconButton(icon:Icon(Icons.arrow_back_ios) ,onPressed: ()=>Get.back(),),),

        body:RefreshIndicator(

          color: Colors.blueAccent,
          onRefresh: () async {
            controller.RefreshNote(showMessage: false);
          },
          child: controller.isloading.value==true?Center(child: CircularProgressIndicator(color: Colors.blueAccent,),): ListView.builder(
            // the number of items in the list
              itemCount: controller.notes.length,

              // display each item of the product list
              itemBuilder: (context, index) {
                return Padding(padding: EdgeInsets.all(10),child:

                GestureDetector(onTap: (){

                  Get.toNamed(Routes.NOTEFICATION,arguments: {'title':controller.notes.elementAt(index).notfication.toString(),'body':controller.notes.elementAt(index).content_note.toString(),'image':controller.notes.elementAt(index).img_note.toString()});

                },child: Container(
                  width: Get.width-20,
                  margin: EdgeInsetsDirectional.only(end: 0, start: 0),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(children: [
                        CachedNetworkImage(
                          imageUrl: controller.urlimage.toString()+controller.notes.elementAt(index).img_note.toString(),
                          imageBuilder: (context, imageProvider) => Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                          ),
                          placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),

                      ],),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text(controller.notes.elementAt(index).notfication.toString().tr,style: TextStyle(fontSize: 17),),
                          SizedBox(height:10),
                          Row(
                            children: [
                              Text(DateFormat('d').format(DateTime.parse(controller.notes.value.elementAt(index).date_sending!.toString())).tr+"  "+DateFormat('MMM').format(DateTime.parse(controller.notes.value.elementAt(index).date_sending!.toString())).tr+" , "+DateFormat('yyyy').format(DateTime.parse(controller.notes.value.elementAt(index).date_sending!.toString())).tr,
                              ),
                              SizedBox(width: 20,),Text(DateFormat('hh').format(DateTime.parse(controller.notes.value.elementAt(index).date_sending!.toString())).tr+":"+DateFormat('mm').format(DateTime.parse(controller.notes.value.elementAt(index).date_sending!.toString())).tr                        ),

                            ],)
                        ],)
                    ],
                  ),

                )),);
              }),
        )
    );});
  }
}
