
import 'package:agenna/app/modules/reservation/controller/reservation_controller.dart';
import 'package:get/get.dart';
import 'package:agenna/app/modules/home/controllers/home_controller.dart';
import 'package:agenna/app/modules/settings/controllers/settings_controller.dart';
import 'package:agenna/app/modules/tab/controller/tab_controller.dart';
import 'package:agenna/app/modules/visiting/controller/visiting_controller.dart';

class TabsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TabsController>(
            () => TabsController()
    );
    Get.lazyPut<HomeController>(
            () => HomeController()
    );
    Get.lazyPut<SettingsController>(
            () => SettingsController()
    );

    Get.lazyPut<VisitingController>(
            () => VisitingController()
    );
  /*  Get.lazyPut<ReservationController>(
            () => ReservationController()
    );*/

  }
}