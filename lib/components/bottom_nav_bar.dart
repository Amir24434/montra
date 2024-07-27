import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:montra/utils/app_colors.dart';
import 'package:montra/views/home/home.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stylish Bottom Navigation Bar Example',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const AnimatedBarExample(),
    );
  }
}

class AnimatedBarExample extends StatefulWidget {
  const AnimatedBarExample({super.key});

  @override
  State<AnimatedBarExample> createState() => _AnimatedBarExampleState();
}

class _AnimatedBarExampleState extends State<AnimatedBarExample> {
  int selected = 0;
  bool heart = false;
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // To make floating action button notch transparent

      bottomNavigationBar: StylishBottomBar(
        option: DotBarOptions(
          dotStyle: DotStyle.tile,
        ),
        items: [
          BottomBarItem(
            icon: const Icon(
              Icons.house_outlined,
            ),
            selectedIcon: const Icon(Icons.house_rounded),
            selectedColor: AppColors.primaryColor,
            unSelectedColor: Colors.grey,
            title: const Text('Home'),
            badge: const Text('9+'),
            showBadge: true,
            badgeColor: AppColors.primaryColor,
            badgePadding: const EdgeInsets.only(left: 4, right: 4),
          ),
          BottomBarItem(
            icon: const Icon(Icons.wifi_protected_setup_sharp),
            selectedIcon: const Icon(Icons.wifi_protected_setup_sharp),
            selectedColor: AppColors.primaryColor,
            title: const Text('Transaction'),
          ),
          BottomBarItem(
            icon: const Icon(
              Icons.pie_chart,
            ),
            selectedIcon: const Icon(
              Icons.pie_chart,
            ),
            selectedColor: AppColors.primaryColor,
            title: const Text('Budget'),
          ),
          BottomBarItem(
            icon: const Icon(
              Icons.person,
            ),
            selectedIcon: const Icon(
              Icons.person,
            ),
            selectedColor: Colors.deepPurple,
            title: const Text('Profile'),
          ),
        ],
        hasNotch: true,
        fabLocation: StylishBarFabLocation.center,
        currentIndex: selected,
        notchStyle: NotchStyle.circle,
        onTap: (index) {
          if (index == selected) return;
          controller.jumpToPage(index);
          setState(() {
            selected = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            heart = !heart;
          });
        },
        backgroundColor: AppColors.primaryColor,
        shape: const CircleBorder(), // Ensures the button is circular
        child: Icon(
          heart ? Icons.cancel_outlined : CupertinoIcons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: PageView(
          controller: controller,
          children: [
            HomeScreen(),
            const Center(child: Text('Star')),
            const Center(child: Text('Style')),
            const Center(child: Text('Profile')),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const BottomNav());
}
