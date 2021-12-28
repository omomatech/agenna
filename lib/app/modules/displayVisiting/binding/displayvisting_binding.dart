import 'package:agenna/app/modules/displayVisiting/controller/displayvisting_controller.dart';
import 'package:get/get.dart';

class DisplayVisitingbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DisplayVisitingController());
  }
}
