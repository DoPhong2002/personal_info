import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class WrapperController extends GetxController{
  late PageController pageController;
  bool isSelected = false;

  RxInt currentPage = 0.obs;
  void goToTab(int page){
    currentPage.value = page;
    pageController.jumpToPage(page);
  }
  void selected(bool value){
    isSelected = value;
    update();
  }
  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }
  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}