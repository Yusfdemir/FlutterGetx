import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/components/navigationBar.dart';
import 'package:news_app/controller/bottomNavigationController.dart';

class HomePageController extends StatelessWidget {
  const HomePageController({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController controller = Get.put(BottomNavController());
    return Scaffold(
      floatingActionButton: MyBottomNavBar(),
      body: Obx(() => controller.pages[controller.index.value]),
    );
  }
}
