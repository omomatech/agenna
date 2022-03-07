
import 'package:get/get.dart';

class NoteFicationController extends GetxController{

      final body=''.obs;
      final image=''.obs;
      final title=''.obs;
      final urlimage="http://ec2-3-15-175-95.us-east-2.compute.amazonaws.com:8000";
      NoteFicationController(){}

  @override
  void onInit() async{

    body.value=Get.arguments['body'];
     image.value =Get.arguments['image'].toString().contains('/media/')?Get.arguments['image']:"/media/"+Get.arguments['image'];

     title.value =Get.arguments['title'];


    super.onInit();
  }

}