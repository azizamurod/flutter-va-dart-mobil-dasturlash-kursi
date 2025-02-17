import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/widgets/home/meal_card.dart';

class MealsByCategorySection extends StatelessWidget {
  const MealsByCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 22,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...[
                "Random meal",
                "Breakfast",
                "Dinner",
                "Vegan",
                "Salads",
                "Deserts"
              ].map((category) {
                return CategoryItem(
                  text: category,
                  isActive: category == "Random meal",
                  onTap: () {},
                );
              }),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 275,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...[
                {
                  "image": "assets/images/category_img1.png",
                  "name": "Spiced Fried Chicken",
                  "country": "Japanese",
                },
                {
                  "image": "assets/images/category_img2.png",
                  "name": "Chicken Tomato Salad",
                  "country": "Japanese",
                },
              ].map((Map<String, String> meal) {
                return HomePageMealCard(
                  image: meal["image"]!,
                  name: meal["name"]!,
                  country: meal["country"]!,
                  onTap: () {},
                );
              }),
            ],
          ),
        ),
      ],
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
