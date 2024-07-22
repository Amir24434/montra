import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:montra/components/custom_button.dart';
import 'package:montra/extensions/space_exs.dart';
import 'package:montra/utils/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
        title: const Text("Sign Up"),
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
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              20.h,
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: Icon(Icons.visibility_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              20.h,
              CustomButton(
                bgColor: AppColors.primaryColor,
                text: "Sign Up",
                onPressed: () {},
                color: Colors.white,
              ),
              20.h,
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
              20.h,
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account yet? ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Sign Uo',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
