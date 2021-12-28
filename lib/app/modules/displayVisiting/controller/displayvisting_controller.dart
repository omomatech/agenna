
import 'package:agenna/app/services/connectivity.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:agenna/app/models/img_visting_model.dart';
import 'package:agenna/app/repositories/img_repository.dart';
import 'package:agenna/app/widgets/ui_function.dart';
class DisplayVisitingController extends GetxController {


  final urlimage="http://ec2-3-15-175-95.us-east-2.compute.amazonaws.com:8000";
  Img_Visiting_Repository? _img_Visiting_Repository;
  final ImageVisitingList =<ImgVisiting_model>[].obs;
  final isloading=false.obs;
  final argumentData = Get.arguments;
  final token=''.obs;
  final uuid=''.obs;



  DisplayVisitingController(){

    _img_Visiting_Repository=Img_Visiting_Repository();
  }



  @override
  Future<void> onInit() async {

    token.value=argumentData[0]['token'];
    uuid.value=argumentData[1]['uuid'];
    isloading.value=true;
    await GetImages(uuid.value.toString(),token.value.toString());
    super.onInit();
    isloading.value=false;
  }

Future showimage(String url,BuildContext cn)async{
  final imageProvider = Image.network(url).image;
  showImageViewer(cn,imageProvider, onViewerDismissed: () {

  });
}

  Future refreshImage({bool showMessage = false}) async {
    isloading.value = true;
    await GetImages(uuid.value.toString(),token.value.toString());
    isloading.value=false;
    if (showMessage) {
      Get.showSnackbar(UiFunction.SuccessSnackBar(message: "Home page refreshed successfully".tr));
    }
  }

/*
  ///save network image to photo
  Future<bool> saveNetworkImageToPhoto(String url, {bool useCache: true}) async {
    var data = await getNetworkImageData(url, useCache: useCache);
    var filePath = await ImagePickerSaver.saveFile(fileData: data);
    return filePath != null && filePath != "";
  }
  */


  Future GetImages(String uuid,String token) async{

    try{

      ImageVisitingList.value = await _img_Visiting_Repository!.Img_Visitings(uuid,token);


    }catch(e){
      if(Get.find<ConnetivityController>().connectionStatus==0)
      {
        Get.showSnackbar(UiFunction.ErrorSnackBar(message: "no internet".tr));
      }
      else {
        Get.showSnackbar(UiFunction.ErrorSnackBar(message: e.toString()));
      }

    }
  }
}
