import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/recipe_model.dart';

import '/screens/main_screen.dart';
import '/screens/splash_screen.dart';
import '/screens/onboarding_screen.dart';
import '/screens/last_viewed_screen.dart';
import '/screens/recipe_detail_screen.dart';
import '/screens/search_history_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context)=> RecipeModel(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/main': (context) => const MainScreen(),
        '/recipe-detail': (context) => const RecipeDetailScreen(),
        '/last-viewed': (context) => const LastViewedScreen(),
        '/search-history': (context) => const SearchHistoryScreen(),
      },
    );
  }
}
