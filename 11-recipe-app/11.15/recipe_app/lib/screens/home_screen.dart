import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/recipe_model.dart';

import '/widgets/loading.dart';
import '/widgets/home/ingredients_section.dart';
import '/widgets/home/meals_by_category_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeModel>(
      builder: (context, recipeModel, child) {
        return recipeModel.isInitialDataLoading
            ? Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Transform.scale(
                  scale: 1.4,
                  child: const Loading(),
                ),
              )
            : const Column(
                children: [
                  HomePageIngredientsSection(),
                  SizedBox(height: 36),
                  MealsByCategorySection(),
                ],
              );
      },
    );
  }
}
