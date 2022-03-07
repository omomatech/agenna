import 'package:agenna/app/modules/reservation/controller/reservation_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReservationView extends GetView<ReservationController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return   Container(
      height: 200,
      child: CupertinoDatePicker(

        mode: CupertinoDatePickerMode.date,
        initialDateTime:controller.selectedDate,
        onDateTimeChanged: (DateTime newDateTime) {
          controller.time.value=newDateTime.toString();

        },
      minimumDate:controller.selectedDate ,
      maximumDate: DateTime.now().add((Duration(days: 10))),

      ),
    );
  }

}