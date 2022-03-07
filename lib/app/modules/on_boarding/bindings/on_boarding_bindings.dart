import 'package:agenna/app/modules/on_boarding/controller/onboarding_controller.dart';
import 'package:get/get.dart';

class OnBoardingBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnBoardingController());
  }
}
