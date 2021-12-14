import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.text,
      maxLines: 1,
      textAlign: TextAlign.start,
      style: Theme.of(context).textTheme.bodyText1,
      cursorColor: const Color(0xff0D1F2D),
      decoration: const InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.only(left: 8, bottom: 2, top: 2, right: 8),
      ),
    );
    ;
  }
}
