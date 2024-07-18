import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  Timer? timer;

// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

//Update Current Index when Page Scroll
  void updatePageIndicator(index) {
    currentPageIndex.value = index;
    if (index == -1) {}
  }

//Update Current Index & jump to next page
  void goToSignUpPage() {
    //Get.to(SignUpScreen());
  }

  void goToSelectCategoryPage() {
    // Get.off(() => const SelectCategoryScreen());
  }

  void goToSignInPage() {
    //Get.off(() => const SignInScreen());
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (currentPageIndex.value == -1) {
        pageController.previousPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      } else {
        pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      }
    });
  }
}
