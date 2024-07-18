import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:montra/utils/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Stack(
          children: [
            Positioned(
              top: 40,
              left: 60,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pink.withOpacity(0.5), // Shadow color
                      blurRadius: 25, // Blur radius
                      // offset: Offset(10, 10), // Shadow offset
                      spreadRadius: 40, // Spread radius
                    ),
                  ],
                ),
                height: 2,
                width: 2,
              ),
            ),
            Text(
              "montra",
              style: GoogleFonts.inter(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 56,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
