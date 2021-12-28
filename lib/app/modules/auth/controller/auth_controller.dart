// ignore_for_file: prefer_const_constructors

import 'package:agenna/app/services/connectivity.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:agenna/app/models/user_model.dart';
import 'package:agenna/app/repositories/user_repository.dart';
import 'package:agenna/app/routes/app_pages.dart';
import 'package:agenna/app/widgets/ui_function.dart';


class AuthController extends GetxController {
  // ignore: unnecessary_new

  final hidePassword = true.obs;
  final checkedMale = false.obs;
  final isloading=false.obs;
  final token_notifcation=''.obs;
  final password=TextEditingController(text: '');
  final username=TextEditingController(text: '');
  final user = User().obs;
  final box=GetStorage();
 final f=''.obs;
  UserRepository? _userRepository;
  AuthController(){
    _userRepository= UserRepository();}

  @override
  void onInit() async{

    bool token =await box.hasData('token');
    bool unique_id=await box.hasData('unique_id');
    if(!box.hasData('first')) {
    await  box.write('first', 'no');

    }

    if(token&&unique_id)
      {

        Get.offAllNamed(Routes.TAB);
      }
    super.onInit();
  }
  Future<void> getlogin({String? username,String? password}) async {
    try {
      isloading.value=true;
     await FirebaseMessaging.instance.getToken().then((String? value) =>token_notifcation.value=value!);


      var response = await _userRepository!.login(username!,password!,token_notifcation.value.toString());
      user.value=response;

      isloading.value=false;
      if(user.value.token.toString().isNotEmpty)
        {

       await   box.write('token', user.value.token.toString());
       await  box.write('unique_id', user.value.unique_id.toString());

          Get.offAndToNamed(Routes.TAB);
        }
    } catch (e) {
         isloading.value=false;
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
