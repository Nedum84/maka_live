import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertUtils {
  static void alert(String content, {String? title, String? okBtnTxt, Function()? okBtnCallback}) {
    Get.dialog(
      AlertDialog(
        title: (title != null) ? Text(title) : Container(),
        content: Text(content),
        actions: <Widget>[
          MaterialButton(
            child: const Text("OK"),
            onPressed: () {
              Get.back();
            },
          ),
          if (okBtnTxt != null)
            MaterialButton(
              child: Text(
                "$okBtnTxt ",
              ),
              onPressed: () {
                Get.back();
                okBtnCallback!();
              },
            )
        ],
      ),
    );
  }
}
