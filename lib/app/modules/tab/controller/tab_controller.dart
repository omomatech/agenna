import 'package:agenna/app/modules/reservation/view/reservation_view.dart';
import 'package:agenna/app/modules/settings/views/settings_view.dart';
import 'package:agenna/app/modules/visiting/view/view_visiting.dart';

import '../../home/views/home_view.dart';
import '../../../routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabsController extends GetxController{
  final currentIndex = 0.obs;



  List<Widget> pages = [
    HomeView(),
    //ReservationView(),
    VisitingView(),
    SettingsView(),


  ];

  Widget get currentPage => pages[currentIndex.value];

}