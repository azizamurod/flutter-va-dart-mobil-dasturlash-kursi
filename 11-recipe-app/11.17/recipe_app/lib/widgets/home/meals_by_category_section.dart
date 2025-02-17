import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '/recipe_model.dart';

import '/widgets/loading.dart';
import '/widgets/error_text.dart';
import '/widgets/home/meal_card.dart';

class MealsByCategorySection extends StatelessWidget {
  const MealsByCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeModel>(
      builder: (context, recipeModel, child) {
        return Column(
          children: [
            SizedBox(
              height: 22,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: recipeModel.categories.length,
                itemBuilder: (context, index) {
                  return CategoryItem(
                    text: recipeModel.categories[index].strCategory ?? '',
                    isActive: recipeModel.activeCategory ==
                        recipeModel.categories[index].strCategory,
                    onTap: () {
                      recipeModel.selectActiveCategory(
                        recipeModel.categories[index].strCategory,
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 250,
              child: recipeModel.mealsForCategory.hasLoaded
                  ? (recipeModel.mealsForCategory.hasErrored
                      ? const ErrorText()
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: recipeModel.mealsForCategory.data.length,
                          itemBuilder: (context, index) {
                            return HomePageMealCard(
                              image: recipeModel.mealsForCategory.data[index]
                                      .strMealThumb ??
                                  '',
                              name: recipeModel
                                      .mealsForCategory.data[index].strMeal ??
                                  '',
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/recipe-detail',
                                  arguments: recipeModel
                                      .mealsForCategory.data[index].idMeal,
                                );
                                recipeModel.addToLastViewed(
                                  recipeModel.mealsForCategory.data[index],
                                );
                              },
                            );
                          },
                        ))
                  : const Loading(),
            ),
          ],
        );
      },
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.text,
    required this.isActive,
    required this.onTap,
  });

  final String text;
  final bool isActive;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.only(right: 24),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isActive
                ? const Color.fromRGBO(15, 23, 42, 1)
                : const Color.fromRGBO(148, 163, 184, 1),
          ),
        ),
      ),
    );
  }
}
