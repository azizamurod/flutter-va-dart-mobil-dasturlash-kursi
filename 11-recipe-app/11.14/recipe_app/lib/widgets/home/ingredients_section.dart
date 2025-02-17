import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '/recipe_model.dart';

import '/widgets/loading.dart';
import '/widgets/error_text.dart';
import '/widgets/home/meal_card.dart';

class HomePageIngredientsSection extends StatelessWidget {
  const HomePageIngredientsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeModel>(
      builder: (context, recipeModel, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What's in your fridge?",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(15, 23, 42, 1),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 38,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: recipeModel.ingredients.length,
                itemBuilder: (context, index) {
                  return IngredientItem(
                    icon:
                        "https://www.themealdb.com/images/ingredients/${recipeModel.ingredients[index].strIngredient}.png",
                    text: recipeModel.ingredients[index].strIngredient ?? '',
                    isActive: recipeModel.activeIngredient ==
                        recipeModel.ingredients[index].strIngredient,
                    onTap: () {
                      recipeModel.selectActiveIngredient(
                        recipeModel.ingredients[index].strIngredient,
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 250,
              child: recipeModel.mealsForIngredient.hasLoaded
                  ? (recipeModel.mealsForIngredient.hasErrored
                      ? const ErrorText()
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: recipeModel.mealsForIngredient.data.length,
                          itemBuilder: (context, index) {
                            return HomePageMealCard(
                              image: recipeModel.mealsForIngredient.data[index]
                                      .strMealThumb ??
                                  '',
                              name: recipeModel
                                      .mealsForIngredient.data[index].strMeal ??
                                  '',
                              onTap: () {
                                Navigator.pushNamed(context, '/recipe-detail',
                                arguments: recipeModel
                                      .mealsForIngredient.data[index].idMeal,
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

class IngredientItem extends StatelessWidget {
  const IngredientItem({
    super.key,
    required this.icon,
    required this.text,
    required this.isActive,
    required this.onTap,
  });

  final String icon;
  final String text;
  final bool isActive;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: isActive
              ? const Color.fromRGBO(251, 148, 0, 1)
              : const Color.fromRGBO(243, 244, 246, 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Image.network(icon),
            const SizedBox(width: 10),
            Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isActive
                    ? Colors.white
                    : const Color.fromRGBO(156, 163, 175, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
