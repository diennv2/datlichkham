import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  final rootPageIndex = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    pageController = PageController(initialPage: rootPageIndex.value);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pageController.dispose();
  }

  void onPageChanged(int index) {
    rootPageIndex(index);
    update();
  }

  Future<void> changeRootPageIndex(int index) async {
    rootPageIndex(index);
    pageController.jumpToPage(index);
    update();
  }

  Future<bool> onWillPop() async {
    Get.back();
    return true;
  }
}
