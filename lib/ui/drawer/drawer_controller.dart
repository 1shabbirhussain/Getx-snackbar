import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';

class CustomDrawerController extends GetxController {
  final AdvancedDrawerController _advancedDrawerController =
      AdvancedDrawerController();
  late PageController _pageController;
  RxInt selectedIndex = 0.obs; // Use RxInt for reactivity

  @override
  void onInit() {
    super.onInit();
    _pageController = PageController(initialPage: selectedIndex.value);
  }

  void onPageChanged(int index) {
    selectedIndex.value = index;
  }

  void handleMenuButtonPressed() {
    _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }

  void onTabChange(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  void onClose() {
    _pageController?.dispose();
    super.onClose();
  }

  // Getters
  AdvancedDrawerController get advancedDrawerController =>
      _advancedDrawerController;
  PageController? get pageController => _pageController;
}
