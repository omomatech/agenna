import 'package:get/get.dart';
import 'package:agenna/app/modules/entery/controller/enter_controller.dart';

class EnteryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EnteryController());
  }
}
