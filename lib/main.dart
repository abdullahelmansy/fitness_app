import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/core/utils/themes.dart';
import 'package:new_project/core/dio/dio_provider.dart';
import 'package:new_project/feature/food/presentation/bloc/food_search_bloc.dart';
import 'package:new_project/feature/intro/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DioProvider.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NutritionBloc(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: AppThemes.lightTheme,
          home: const SplashView(),
          debugShowCheckedModeBanner: false),
    );
  }
}
