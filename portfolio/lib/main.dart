import 'package:flutter/material.dart';
import 'package:portfolio/main_pages/homePage.dart';
import 'package:portfolio/res/color.dart';
import 'package:portfolio/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: AppColor.fontColor,
        scaffoldBackgroundColor: AppColor.background,
        // splashColor: AppColor.fontColor,
        fontFamily: "ComicSansMS",
      ),
      // home: SplashScreen(),
      home: HomePage(),
    );
  }
}
