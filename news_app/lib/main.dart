import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/config/theme.dart';
import 'package:news_app/homePageController.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
      home: HomePageController(),
    );
  }
}
