
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:agenna/app/modules/entery/binding/enter_binding.dart';
import 'package:agenna/app/modules/entery/view/entery_view.dart';
import 'package:agenna/app/modules/on_boarding/bindings/on_boarding_bindings.dart';
import 'package:agenna/app/modules/on_boarding/views/on_boarding_view.dart';
import 'package:agenna/app/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';


class EnteryController extends GetxController{

  final countnote=0.obs;
 final box=GetStorage();
 final first='yes'.obs;
@override
  void onInit() async{
  Get.forceAppUpdate();
  first.value=await box.hasData('first')?await box.read('first'):'yes';

  if(first.value.toString()!='no')
    {
      await box.write('first', 'no');
    }

    super.onInit();
  }




}