import 'package:flutter/material.dart';
import 'package:maka_live/utils/styles/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.controller, this.textInputType = TextInputType.text}) : super(key: key);
  final TextEditingController controller;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: KColors.TEXT_COLOR_LIGHT.withOpacity(.5)),
        color: Colors.white,
      ),
      child: TextField(
        controller: controller,
        keyboardType: textInputType,
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
      ),
    );
    ;
  }
}
