// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:agenna/app/modules/entery/controller/enter_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:agenna/app/modules/auth/controller/auth_controller.dart';
import 'package:agenna/app/routes/app_pages.dart';
import 'package:agenna/app/widgets/block_button_widget.dart';
import 'package:agenna/app/widgets/text_input_fromfield.dart';
import 'package:agenna/app/widgets/ui_function.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:get/get.dart';

class AuthLoginView extends GetView<AuthController> {
  AuthController controller=Get.put(AuthController());
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading:  Get.put(EnteryController()).first.value.toString()=='no'?SizedBox(): GestureDetector(
            onTap: () {
              Get.offAndToNamed(Routes.ROOT);


            },
            child: Icon(
              Icons.arrow_back_ios,
              color: context.theme.accentColor,
            ),
          ),
        ),
        body: Obx((){return controller.isloading.value==true?Center(child: CircularProgressIndicator(),): Form(

          key: _globalKey,
          child: ListView(
            primary: true,
            children: [
              Container(

                height: 80,
                child: Center(
                  child: Image.asset("asset/img/man.png",color: Get.theme.accentColor,),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              InputFromField(

                title: Text("phone number".tr, style: TextStyle(color: Get.theme.accentColor,fontWeight: FontWeight.bold,fontSize: 20)),
                content: TextFormField(
                 controller: controller.username,
                  cursorWidth: 4.0,
                  cursorColor: Colors.blue,
                  maxLength: 11,

                  keyboardType: TextInputType.phone,
                  validator: (value) {

                    if (!value!.isPhoneNumber) {
                      return 'Please enter valid phone number'.tr;
                    }
                    return null;

                  },


                  style: Get.textTheme.headline4,
                  decoration: UiFunction.getInputDecoration(

                    hintText: "Enter phone number".tr,
                    iconData: Icons.phone_android,
                  ),
                ),
              ),
              Obx(() {
                return InputFromField(

                  title: Text("Password".tr, style: TextStyle(color: Get.theme.accentColor,fontWeight: FontWeight.bold,fontSize: 20)),
                  content: TextFormField(
                    controller: controller.password,
                    cursorColor: Colors.blue,

                    keyboardType: TextInputType.number,
                    maxLength: 10,

                    obscureText: controller.hidePassword.value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter password'.tr;
                      }
                    },


                    style: Get.textTheme.headline4,
                    decoration: UiFunction.getInputDecoration(
                      hintText: "••••••••••••".tr,
                      iconData: Icons.lock_outline,
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.hidePassword.value =
                          !controller.hidePassword.value;
                        },
                        color: Get.theme.accentColor,
                        icon: Icon(controller.hidePassword.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                      ),
                    ),
                  ),
                );
              }),
              SizedBox(height: Get.height/6,),
            Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    width: Get.width,
                    child: BlockButtonWidget(
                        color: Get.theme.accentColor,
                        text: Text(
                          'Log In'.tr,
                          style: Get.textTheme.button!
                              .merge(TextStyle(color: Colors.white)),),
                        onPressed: () {
                          if (_globalKey.currentState!.validate()) {

                            controller.getlogin(username: controller.username.text,
                                password: controller.password.value.text);
                          }
                        }),
                  ),
                ],
              )

            ],
          ),
        );})
    );
  }
}
