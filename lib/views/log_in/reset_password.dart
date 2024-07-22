import 'package:flutter/material.dart';
import 'package:montra/components/custom_button.dart';
import 'package:montra/extensions/space_exs.dart';
import 'package:montra/utils/app_colors.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
        title: const Text("Reset Password"),
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
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'New Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              20.h,
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Retype new password',
                  suffixIcon: const Icon(Icons.visibility_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              20.h,
              CustomButton(
                bgColor: AppColors.primaryColor,
                text: "Continue",
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
