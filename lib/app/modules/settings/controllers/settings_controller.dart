
import 'dart:convert';

import 'package:agenna/app/modules/auth/controller/auth_controller.dart';
import 'package:agenna/app/modules/auth/controller/auth_controller.dart';
import 'package:agenna/app/modules/auth/controller/auth_controller.dart';
import 'package:agenna/app/modules/entery/controller/enter_controller.dart';
import 'package:agenna/app/repositories/setting_repository.dart';
import 'package:agenna/app/routes/app_pages.dart';
import 'package:agenna/app/services/connectivity.dart';

import 'package:agenna/app/widgets/ui_function.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class SettingsController extends GetxController {
 final isloading=false.obs;
 final token=''.obs;

 final box=GetStorage();
  SettingRepos _userRepository=SettingRepos();

  AuthController() {

  }

  @override
  void onInit() async {
  token.value=box.read('token');
    super.onInit();
  }

  Future<void> logoutfunc() async {
    try {

        isloading.value=true;
        var response=await _userRepository.logoutapi(token.value.toString());
        isloading.value=false;

        if(response['logout'].toString()=='true')
          {
            await box.remove('token');
            await box.remove('unique_id');
            await box.write('first', 'no');
            Get.forceAppUpdate();
            Get.find<EnteryController>().first.value=='no';

            Get.offAllNamed(Routes.LOGIN);

          }


    } catch (e) {
      if(Get.find<ConnetivityController>().connectionStatus==0)
      {
        Get.showSnackbar(UiFunction.ErrorSnackBar(message: "no internet".tr));
      }
      else {
        Get.showSnackbar(UiFunction.ErrorSnackBar(message: e.toString().tr));
      }

    }
  }
}
