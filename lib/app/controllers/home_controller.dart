import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt selectedNavIndex = 0.obs;
  final RxBool isMobileMenuOpen = false.obs;
  final ScrollController scrollController = ScrollController();

  final List<String> navItems = [
    'Home',
    'About',
    'Education',
    'Skills',
    'Projects',
    'Contact',
  ];

  void setNavIndex(int index) {
    selectedNavIndex.value = index;
    isMobileMenuOpen.value = false;
  }

  void toggleMobileMenu() {
    isMobileMenuOpen.value = !isMobileMenuOpen.value;
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
