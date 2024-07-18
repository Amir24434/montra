import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:montra/components/custom_button.dart';
import 'package:montra/controller/onboarding_controller.dart';
import 'package:montra/extensions/space_exs.dart';
import 'package:montra/views/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:montra/views/onboarding/widgets/onboarding_page.dart';
import 'package:montra/utils/app_colors.dart';
import 'package:montra/utils/constants.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = Get.put(OnboardingController());

  // @override
  // void initState() {
  //   super.initState();
  //   controller.startTimer();
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              children: const [
                OnboardingPage(
                  image: AppImages.onBoardingImage1,
                  title: AppTexts.onboardingTitle1,
                  subtitle: AppTexts.onboardingSubtitle1,
                ),
                OnboardingPage(
                  image: AppImages.onBoardingImage2,
                  title: AppTexts.onboardingTitle2,
                  subtitle: AppTexts.onboardingSubtitle2,
                ),
                OnboardingPage(
                  image: AppImages.onBoardingImage3,
                  title: AppTexts.onboardingTitle3,
                  subtitle: AppTexts.onboardingSubtitle3,
                ),
              ],
            ),
            const OnboardingDotNavigation(),
            28.h,
            Positioned.fill(
              bottom: kFloatingActionButtonMargin - 600,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      onPressed: () => OnboardingController.instance
                          .goToSelectCategoryPage(),
                      text: 'Sign Up',
                      bgColor: AppColors.primaryColor,
                      color: AppColors.secondaryColor,
                    ),
                    10.h,
                    Padding(
                      padding: EdgeInsets.only(bottom: size * 0.03),
                      child: CustomButton(
                        onPressed: () =>
                            OnboardingController.instance.goToSignInPage(),
                        text: 'Login',
                        bgColor: AppColors.secondaryColor,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
