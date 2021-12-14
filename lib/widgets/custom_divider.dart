import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double? width;
  final Color? color;

  const CustomDivider({Key? key, this.width, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 60,
      height: 2, // Thickness
      color: color ?? Theme.of(context).dividerColor,
      margin: const EdgeInsets.symmetric(vertical: 6),
    );
  }
}
