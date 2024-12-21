import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/core/utils/themes.dart';
import 'package:new_project/core/dio/dio_provider.dart';
import 'package:new_project/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:new_project/feature/food/presentation/bloc/food_search_bloc.dart';
import 'package:new_project/feature/food/presentation/screen/nutrition_home_page.dart';
import 'package:new_project/feature/home/presentation/bloc/exercise_bloc.dart';
import 'package:new_project/feature/intro/splash_view.dart';
import 'package:new_project/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await DioProvider.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ExerciseBloc(),
        ),
        BlocProvider(
          create: (context) => NutritionBloc(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        )
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: AppThemes.lightTheme,
          home: const SplashView(),
          debugShowCheckedModeBanner: false),
    );
  }
}
