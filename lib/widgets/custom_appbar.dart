import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomAppbar extends StatelessWidget {
  final String? title;
  final List<Widget>? actionBtn;
  final bool makeTransparent;
  final double? titleFontSize;
  final Color? shadowColor;

  const CustomAppbar({
    Key? key,
    required this.title,
    this.actionBtn,
    this.makeTransparent = false,
    this.titleFontSize,
    this.shadowColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: makeTransparent ? Colors.transparent : Colors.white,
      shadowColor: shadowColor ?? Colors.transparent,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => Get.back(),
      ),
      centerTitle: false,
      title: Text(
        title ?? "",
        // style: Theme.of(context).textTheme.headline6,
      ),
      actions: actionBtn ?? [Container()],
    );
  }
}
