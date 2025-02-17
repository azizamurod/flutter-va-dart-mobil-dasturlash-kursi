import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '/recipe_model.dart';

import 'last_viewed_meal_card.dart';

class LastViewedSection extends StatelessWidget {
  const LastViewedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeModel>(builder: (context, recipeModel, child) {
      return recipeModel.lastViewedMeals.isEmpty
          ? const SizedBox()
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 26),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Last viewed",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(15, 23, 42, 1),
                        ),
                      ),
                      recipeModel.lastViewedMeals.length > 3
                          ? GestureDetector(
                              onTap: () =>
                                  Navigator.pushNamed(context, '/last-viewed'),
                              child: Text(
                                "See All",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(251, 148, 0, 1),
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 155,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      recipeModel.lastViewedMeals.isNotEmpty
                          ? LastViewedMealCardForSearchScreen(
                              image:
                                  recipeModel.lastViewedMeals[0].strMealThumb ??
                                      '',
                              name:
                                  recipeModel.lastViewedMeals[0].strMeal ?? '',
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/recipe-detail',
                                  arguments:
                                      recipeModel.lastViewedMeals[0].idMeal,
                                );
                                recipeModel.addToLastViewed(
                                  recipeModel.lastViewedMeals[0],
                                );
                              },
                            )
                          : const SizedBox(),
                      recipeModel.lastViewedMeals.length > 1
                          ? LastViewedMealCardForSearchScreen(
                              image:
                                  recipeModel.lastViewedMeals[1].strMealThumb ??
                                      '',
                              name:
                                  recipeModel.lastViewedMeals[1].strMeal ?? '',
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/recipe-detail',
                                  arguments:
                                      recipeModel.lastViewedMeals[1].idMeal,
                                );
                                recipeModel.addToLastViewed(
                                  recipeModel.lastViewedMeals[1],
                                );
                              },
                            )
                          : const SizedBox(),
                      recipeModel.lastViewedMeals.length > 2
                          ? LastViewedMealCardForSearchScreen(
                              image:
                                  recipeModel.lastViewedMeals[2].strMealThumb ??
                                      '',
                              name:
                                  recipeModel.lastViewedMeals[2].strMeal ?? '',
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/recipe-detail',
                                  arguments:
                                      recipeModel.lastViewedMeals[2].idMeal,
                                );
                                recipeModel.addToLastViewed(
                                  recipeModel.lastViewedMeals[2],
                                );
                              },
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ],
            );
    });
  }
}
