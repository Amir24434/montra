import 'package:flutter/material.dart';
import 'package:montra/components/custom_button.dart';
import 'package:montra/extensions/space_exs.dart';
import 'package:montra/utils/app_colors.dart';

class NewIncomeScreen extends StatelessWidget {
  const NewIncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.bgColor2,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor2,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Income",
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
                  "How much?",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                TextField(
                  style: TextStyle(
                    fontSize:
                        67, // Set the font size of the entered text to 67px
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    hintText: '0',
                    hintStyle: TextStyle(
                      fontSize:
                          67, // Set the font size of the hint text to 67px
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    prefixText: '\$',
                    prefixStyle: TextStyle(
                      fontSize:
                          67, // Set the font size of the prefix text to 67px
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  keyboardType: TextInputType.number,
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
                            labelText: 'Category',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                        ),
                        20.h,
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Description',
                            suffixIcon: const Icon(Icons.visibility_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                        ),
                        20.h,
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Wallet',
                            suffixIcon: const Icon(Icons.visibility_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                        ),
                        20.h,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.attachment_outlined),
                            10.w,
                            const Text("Add attachment"),
                          ],
                        ),
                        20.h,
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Repeat",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text("Repeat transaction")
                              ],
                            ),
                            Icon(Icons.toggle_on),
                          ],
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
