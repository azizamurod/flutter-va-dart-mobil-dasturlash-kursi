import 'package:flutter/material.dart';

import '/screens/home_screen.dart';
import '/screens/search_screen.dart';
import '/screens/splash_screen.dart';
import '/screens/onboarding_screen.dart';
import '/screens/last_viewed_screen.dart';
import '/screens/active_search_screen.dart';
import '/screens/recipe_detail_screen.dart';
import '/screens/search_history_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SearchScreen(),
        // '/': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/home': (context) => const HomeScreen(),
        '/recipe-detail': (context) => const RecipeDetailScreen(),
        '/search': (context) => const SearchScreen(),
        '/active-search': (context) => const ActiveSearchScreen(),
        '/last-viewed': (context) => const LastViewedScreen(),
        '/search-history': (context) => const SearchHistoryScreen(),
      },
    );
  }
}
