import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertUtils {
  static void alert(String content, {String? title, Function()? okCallback}) {
    Get.dialog(
      AlertDialog(
        title: (title != null) ? Text(title) : Container(),
        content: Text(content),
        actions: <Widget>[
          MaterialButton(
            child: const Text("OK"),
            onPressed: () {
              Get.back();
              if (okCallback != null) {
                okCallback();
              }
            },
          ),
        ],
      ),
    );
  }
}
