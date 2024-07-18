import 'package:flutter/material.dart';
import 'package:montra/controller/onboarding_controller.dart';
import 'package:montra/utils/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingDotNavigation extends StatefulWidget {
  const OnboardingDotNavigation({super.key});

  @override
  State<OnboardingDotNavigation> createState() =>
      _OnboardingDotNavigationState();
}

class _OnboardingDotNavigationState extends State<OnboardingDotNavigation> {
  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    return Positioned.fill(
      //bottom: kBottomNavigationBarHeight - 520,
      child: Padding(
        padding: const EdgeInsets.only(top: 350),
        child: Align(
          alignment: Alignment.center,
          child: SmoothPageIndicator(
            controller: controller.pageController,
            count: 3,
            effect: const SlideEffect(
              activeDotColor: AppColors.primaryColor,
              dotHeight: 15,
              dotWidth: 15,
            ),
          ),
        ),
      ),
    );
  }
}
