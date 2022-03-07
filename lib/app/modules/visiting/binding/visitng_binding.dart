
import 'package:get/get.dart';
import 'package:agenna/app/modules/visiting/controller/visiting_controller.dart';

class Visitingbinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<VisitingController>(
            () => VisitingController()
    );




  }
}