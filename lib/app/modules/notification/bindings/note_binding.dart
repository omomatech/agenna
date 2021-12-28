import 'package:agenna/app/modules/notification/controllers/note_controller.dart';
import 'package:get/get.dart';

class NoteficationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NoteFicationController());
  }
}
