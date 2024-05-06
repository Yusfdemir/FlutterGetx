import 'package:get/get.dart';
import 'package:news_app/pages/articalpage/articalPage.dart';
import 'package:news_app/pages/homepage/homePage.dart';
import 'package:news_app/pages/profile/profilePage.dart';

class BottomNavController extends GetxController {
  var index = 0.obs;
  var pages = [HomePage(), ArticalPage(), ProfilePage()];
}
