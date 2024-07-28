import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:montra/components/custom_button.dart';
import 'package:montra/extensions/space_exs.dart';
import 'package:montra/utils/app_colors.dart';

class NewExpenseScreen extends StatefulWidget {
  const NewExpenseScreen({super.key});

  @override
  State<NewExpenseScreen> createState() => _NewExpenseScreenState();
}

class _NewExpenseScreenState extends State<NewExpenseScreen> {
  File? _image;
  File? _document;

  Future<void> _getImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _document = null; // Clear document selection
      });
    }
  }

  Future<void> _getImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _document = null; // Clear document selection
      });
    }
  }

  Future<void> _getDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'txt'],
    );

    if (result != null) {
      setState(() {
        _document = File(result.files.single.path!);
        _image = null; // Clear image selection
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.bgColor1,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor1,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Expense",
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
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SizedBox(
                                  height: size.height *
                                      0.25, // Set the height of the BottomSheet
                                  child: Column(
                                    children: [
                                      5.h,
                                      Container(
                                        color: const Color.fromARGB(
                                            255, 238, 219, 255),
                                        height: 5,
                                        width: 40,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.02,
                                          vertical: size.height * 0.03,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            _buildContainer(
                                              context,
                                              'Camera',
                                              Icons.camera_alt_rounded,
                                              _getImageFromCamera,
                                            ),
                                            _buildContainer(
                                              context,
                                              'Image',
                                              Icons.image,
                                              _getImageFromGallery,
                                            ),
                                            _buildContainer(
                                              context,
                                              'Document',
                                              Icons.edit_document,
                                              _getDocument,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.attachment_outlined),
                              10.w,
                              const Text("Add attachment"),
                            ],
                          ),
                        ),
                        10.h,
                        if (_image != null)
                          SizedBox(
                            height: size.height * 0.05,
                            width: size.width * 0.08,
                            child: Image.file(_image!),
                          )
                        else if (_document != null)
                          Text(
                              'Selected document: ${_document!.path.split('/').last}')
                        else
                          const Text('No file selected.'),
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
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SizedBox(
                                  height: size.height *
                                      0.35, // Set the height of the BottomSheet
                                  child: Column(
                                    children: [
                                      5.h,
                                      Container(
                                        color: const Color.fromARGB(
                                            255, 238, 219, 255),
                                        height: 5,
                                        width: 40,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: size.width * 0.01,
                                            vertical: size.height * 0.03,
                                          ),
                                          child: Column(
                                            children: [
                                              Form(
                                                child: Column(
                                                  children: [
                                                    TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: 'Frequency',
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                      ),
                                                    ),
                                                    20.h,
                                                    TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: 'End After',
                                                        suffixIcon: const Icon(Icons
                                                            .visibility_outlined),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                      ),
                                                    ),
                                                    20.h,
                                                    CustomButton(
                                                        color: Colors.white,
                                                        text: "Next",
                                                        onPressed: () {
                                                          showModalBottomSheet(
                                                            context: context,
                                                            builder: (context) {
                                                              return SizedBox(
                                                                height: size
                                                                        .height *
                                                                    0.35, // Set the height of the BottomSheet
                                                                child: Column(
                                                                  children: [
                                                                    5.h,
                                                                    Container(
                                                                      color: const Color
                                                                          .fromARGB(
                                                                          255,
                                                                          238,
                                                                          219,
                                                                          255),
                                                                      height: 5,
                                                                      width: 40,
                                                                    ),
                                                                    Padding(
                                                                        padding:
                                                                            EdgeInsets
                                                                                .symmetric(
                                                                          horizontal:
                                                                              size.width * 0.02,
                                                                          vertical:
                                                                              size.height * 0.03,
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          children: [
                                                                            Form(
                                                                              child: Column(
                                                                                children: [
                                                                                  Row(
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: TextFormField(
                                                                                          decoration: InputDecoration(
                                                                                            labelText: 'Yearly',
                                                                                            border: OutlineInputBorder(
                                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      5.w,
                                                                                      Expanded(
                                                                                        child: TextFormField(
                                                                                          decoration: InputDecoration(
                                                                                            labelText: 'Dec',
                                                                                            border: OutlineInputBorder(
                                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      5.w,
                                                                                      Expanded(
                                                                                        child: TextFormField(
                                                                                          decoration: InputDecoration(
                                                                                            labelText: '29',
                                                                                            border: OutlineInputBorder(
                                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  20.h,
                                                                                  Row(
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: TextFormField(
                                                                                          decoration: InputDecoration(
                                                                                            labelText: 'Date',
                                                                                            suffixIcon: const Icon(Icons.visibility_outlined),
                                                                                            border: OutlineInputBorder(
                                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      10.w,
                                                                                      Expanded(
                                                                                        child: TextFormField(
                                                                                          decoration: InputDecoration(
                                                                                            labelText: '29 Dec 2025',
                                                                                            suffixIcon: const Icon(Icons.visibility_outlined),
                                                                                            border: OutlineInputBorder(
                                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  20.h,
                                                                                  CustomButton(
                                                                                    color: Colors.white,
                                                                                    text: "Next",
                                                                                    onPressed: () {},
                                                                                    bgColor: AppColors.primaryColor,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        )),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                        bgColor: AppColors
                                                            .primaryColor)
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
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

Widget _buildContainer(
  BuildContext context,
  String label,
  IconData? icon,
  VoidCallback onPressed,
) {
  final size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 238, 229, 255),
        borderRadius: BorderRadius.circular(15), // Round edges
      ),

      width: size.width * 0.25, // Set the width of each container
      height: size.height * 0.15, // Set the height of each container
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
          child: Column(
            children: [
              Icon(
                icon,
                color: AppColors.primaryColor,
                size: 50,
              ),
              Text(
                label,
                style: const TextStyle(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
