import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:maka_live/screen/splash_screen.dart';
import 'package:maka_live/utils/styles/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //default orientation to be portrait
  await SystemChrome?.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  //set default status bar color to dark
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      init: ThemeController(),
      builder: (themeController) {
        return GetMaterialApp(
          title: 'MakaLive',
          themeMode: themeController.themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          home: const SplashScreen(),
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  void toggleTheme() {
    ThemeController.to.toggleTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Toggle Theme with the button bellow ',
            ),
            Text(
              ThemeController.to.isDarkMode ? "Dark theme" : "Light theme",
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleTheme,
        tooltip: 'Toggle theme...',
        child: const Icon(Icons.switch_camera),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
