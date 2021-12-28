import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:agenna/app/modules/notification/controllers/note_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Viewurl extends GetView<NoteFicationController> {

  Completer<WebViewController> _controller = Completer<WebViewController>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
           ' controller.link.value.toString().substring(0,25)+".....",',
            style: TextStyle(color: Colors.blue),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: WebView(
          initialUrl:'controller.link.value.toString()',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ));
  }
}