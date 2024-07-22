import 'package:flutter/material.dart';
import 'package:montra/components/custom_button.dart';
import 'package:montra/extensions/space_exs.dart';
import 'package:montra/utils/app_colors.dart';
import 'package:montra/utils/constants.dart';

class ForgotPasswordEmailSent extends StatefulWidget {
  const ForgotPasswordEmailSent({super.key});

  @override
  State<ForgotPasswordEmailSent> createState() =>
      _ForgotPasswordEmailSentState();
}

class _ForgotPasswordEmailSentState extends State<ForgotPasswordEmailSent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 80,
          bottom: 20,
          left: 16,
          right: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Image(
                  fit: BoxFit.fill,
                  image: AssetImage(AppImages.onBoardingImage4),
                  height: 212,
                  width: 212,
                ),
                const Text("Your email is on the way"),
                10.h,
                const Text(
                    "Check your email test@test.com and follow the instructions to reset your password.")
              ],
            ),
            CustomButton(
              bgColor: AppColors.primaryColor,
              text: "Sign Up",
              onPressed: () {},
              color: Colors.white,
            ),
            20.h,
          ],
        ),
      ),
    );
  }
}
