
import 'package:agenna/app/modules/notification/controllers/note_list_controller.dart';
import 'package:get/get.dart';

class NoteListBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NoteListController());
  }
}
