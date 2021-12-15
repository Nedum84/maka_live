import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maka_live/screen/live_show_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _redirect();
  }

  _redirect() async {
    await Future.delayed(const Duration(seconds: 1));
    Get.offAll(() => const LiveShowScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text(
          'MakaLive',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
