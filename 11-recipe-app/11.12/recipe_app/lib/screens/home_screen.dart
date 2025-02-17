import 'package:flutter/material.dart';

import '/widgets/home/ingredients_section.dart';
import '/widgets/home/meals_by_category_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HomePageIngredientsSection(),
        SizedBox(height: 36),
        MealsByCategorySection(),
      ],
    );
  }
}
