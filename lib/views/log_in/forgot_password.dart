import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:montra/components/custom_button.dart';
import 'package:montra/extensions/space_exs.dart';
import 'package:montra/utils/app_colors.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: const Text("Forgot Password"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 80,
          bottom: 20,
          left: 16,
          right: 16,
        ),
        child: Form(
          child: Column(
            children: [
              const Text("Dont worry."),
              const Text(
                  " Enter your email and we'll ssend you a link to reset your password"),
              10.h,
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              10.h,
              CustomButton(
                bgColor: AppColors.primaryColor,
                text: "Sign Up",
                onPressed: () {},
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
