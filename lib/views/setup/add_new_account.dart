import 'package:flutter/material.dart';
import 'package:montra/components/custom_button.dart';
import 'package:montra/extensions/space_exs.dart';
import 'package:montra/utils/app_colors.dart';

class AddNewAccount extends StatelessWidget {
  const AddNewAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Add new account",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.03,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Balance",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "\$00.0",
                  style: TextStyle(
                    fontSize: 67,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )),
            //height: size.height + 0.01,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.03,
                vertical: size.height * 0.03,
              ),
              child: Column(
                children: [
                  //    SizedBox(height: size.height * 0.03),
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                        ),
                        20.h,
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Account Type',
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
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
