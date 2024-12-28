import 'package:flutter/material.dart';
import 'package:new_project/feature/bmi/presentation/view/bmi_view.dart';
import 'package:new_project/feature/food/presentation/screen/nutrition_home_page.dart';
import 'package:new_project/feature/home/presentation/view/exercise/exercise_view.dart';

import '../utils/colors.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int currentIndex = 0;
  List<Widget> views = [
    const ExerciseView(),
    const NutritionHomePage(),
    BMIScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.whiteColor,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/exercise.png',
                width: 25,
              ),
              label: '',
              activeIcon: Image.asset(
                'assets/exercise.png',
                width: 30,
                color: AppColors.primaryColor,
              ),
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.food_bank_rounded),
              label: '',
              // activeIcon: SvgPicture.asset(
              //   'assets/icons/Home.svg',
              //   colorFilter:  ColorFilter.mode(
              //       AppColors.primaryColor, BlendMode.srcIn),
              // ),
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.calculate_outlined),
              label: '',
              // activeIcon: SvgPicture.asset(
              //   'assets/icons/Bookmark.svg',
              //   colorFilter:  ColorFilter.mode(
              //       AppColors.primaryColor, BlendMode.srcIn),
              // ),
            ),
          ]),
    );
  }
}
