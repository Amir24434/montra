import 'package:flutter/material.dart';
import 'package:montra/components/custom_button.dart';
import 'package:montra/extensions/space_exs.dart';
import 'package:montra/utils/app_colors.dart';

class SetupAccount extends StatefulWidget {
  const SetupAccount({super.key});

  @override
  State<SetupAccount> createState() => _SetupAccountState();
}

class _SetupAccountState extends State<SetupAccount> {
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
                const Text("Let's setup your account!"),
                10.h,
                const Text(
                    "Account can be your bank, credit card or your wallet.")
              ],
            ),
            CustomButton(
              bgColor: AppColors.primaryColor,
              text: "Let's go",
              onPressed: () {},
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
