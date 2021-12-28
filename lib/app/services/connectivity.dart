import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:agenna/app/widgets/ui_function.dart';

import 'package:get/get.dart';

class ConnetivityController extends GetxController  {
  var connectionStatus = 0.obs;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;

  @override
  // ignore: must_call_super
  void onInit() {

    initconnectivity ();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateconnectionstatus);
  }


  Future<void> initconnectivity() async {
    ConnectivityResult? result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {

      UiFunction.ErrorSnackBar(
          title: "internt connection", message: e.message.toString());
    }
    return _updateconnectionstatus(result);
  }

  _updateconnectionstatus(ConnectivityResult? result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionStatus.value = 1;

        break;
      case ConnectivityResult.mobile:
        connectionStatus.value = 2;
        break;
      case ConnectivityResult.none:
        connectionStatus.value = 0;
        break;

      default:
        UiFunction.ErrorSnackBar(
            title: "Network Error",
            message: "Failed to get newtwork connection");
        break;
    }
  }
  @override
  void onClose() {
    //  _animationController!.dispose();
    _connectivitySubscription?.cancel();

  }
}
