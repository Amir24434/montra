import 'package:flutter/material.dart';
import 'package:montra/utils/constants.dart';

class SignUpSuccess extends StatelessWidget {
  const SignUpSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(AppImages.onBoardingImage5),
            ),
            Text(
              "You are set!",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
