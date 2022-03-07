
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:agenna/app/modules/displayVisiting/controller/displayvisting_controller.dart';
import 'package:progressive_image/progressive_image.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
class DisplayVisiting_view extends GetView<DisplayVisitingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Obx((){
        return controller.isloading.value==true?Center(child: CircularProgressIndicator(color: Colors.blueAccent,),):Container(
          child:controller.ImageVisitingList.length==0?Container(child: Image.asset("asset/img/noimage.png",fit: BoxFit.cover,),):ListView.builder(
            itemBuilder: (BuildContext ctx, int index) {
                  controller.urlimage.toString()+
                  controller.ImageVisitingList.value
                      .elementAt(index)
                      .img_visiting
                      .toString();

              return



                    Container(
                      width: Get.width-10,
                      margin: EdgeInsetsDirectional.only(end: 20,top: 30,bottom: 15, start: 20),

                      decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(15.0),),
                      child:GestureDetector(
                        onTap: (){
                         controller.showimage(controller.urlimage.toString()+
                             controller.ImageVisitingList.value
                                 .elementAt(index)
                                 .img_visiting
                                 .toString(), context);
                        },
                        child:  Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: ProgressiveImage(
                          repeat: ImageRepeat.noRepeat,
                          fit: BoxFit.cover,
                          placeholder: AssetImage("asset/img/home.png"),
                          // size: 1.87KB
                          thumbnail: AssetImage("asset/img/home.png"),
                          // size: 1.29MB
                          image:CachedNetworkImageProvider(controller.urlimage.toString()+
                              controller.ImageVisitingList.value
                                  .elementAt(index)
                                  .img_visiting
                                  .toString()),
                          height: Get.width-4,
                          width: Get.height-4,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(0),
                      ),// Image of the card

                          )

                  );


            },
            itemCount: controller.ImageVisitingList.value.length,
          )
        );
      })
    );
  }
}
