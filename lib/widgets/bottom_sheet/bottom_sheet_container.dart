import 'package:flutter/material.dart';
import 'package:maka_live/utils/styles/theme.dart';

class BottomSheetContainer extends StatelessWidget {
  final String title;
  final String? subtitle;
  final double? sheetHeight;
  final Widget child;

  const BottomSheetContainer({
    Key? key,
    required this.title,
    this.subtitle,
    required this.child,
    this.sheetHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        height: sheetHeight ?? MediaQuery.of(context).size.height - 60,
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
              child: Container(
                width: 80,
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: kTextTheme(context).headline5,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            if (subtitle != null)
              Text(
                subtitle!,
                textAlign: TextAlign.center,
              ),
            const Divider(thickness: 2),
            child
          ],
        ),
      ),
    );
  }
}
