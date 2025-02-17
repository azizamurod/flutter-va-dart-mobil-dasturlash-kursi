import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/widgets/recipe_detail/circle_and_text.dart';
import '/widgets/recipe_detail/name_and_description.dart';
import '/widgets/recipe_detail/meal_image_and_back_button.dart';

class RecipeDetailScreen extends StatelessWidget {
  const RecipeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MealImageAndBackButton(
              image: "assets/images/meal_detail_img.png",
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const NameAndDescription(
                    name: "Spiced Fried Chicken",
                    description:
                        "Indonesian Fried Chicken or Ayam Goreng, is a delicious and popular dish that showcases the vibrant flavors of Indonesian cuisine.",
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Ingredients",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(15, 23, 42, 1),
                    ),
                  ),
                  const SizedBox(height: 14),
                  ...[
                    "300 grams of egg noodles, boiled until tender",
                    "6 tbsp onion chicken oil",
                    "3 tsp soy sauce",
                    "2 bunches of mustard greens, dipped briefly in boiling water, remove, set aside",
                    "250 grams chicken meat, diced",
                    "6 pieces of boiled feet",
                  ].map(
                    (ingredient) {
                      return CircleAndTextItem(text: ingredient);
                    },
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Steps",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(15, 23, 42, 1),
                    ),
                  ),
                  const SizedBox(height: 14),
                  ...[
                    "300 grams of egg noodles, boiled until tender",
                    "6 tbsp onion chicken oil",
                    "3 tsp soy sauce",
                    "2 bunches of mustard greens, dipped briefly in boiling water, remove, set aside",
                    "250 grams chicken meat, diced",
                    "6 pieces of boiled feet",
                  ].map(
                    (ingredient) {
                      return CircleAndTextItem(text: ingredient);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
