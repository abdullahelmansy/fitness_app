import 'package:flutter/material.dart';
import 'package:new_project/core/functions/navigation.dart';
import 'package:new_project/feature/auth/presentation/view/login_view.dart';
import 'package:new_project/feature/food/presentation/view/food_search_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      pushAndRemoveUntil(context,  const LoginView ());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'assets/splash.jpg',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
