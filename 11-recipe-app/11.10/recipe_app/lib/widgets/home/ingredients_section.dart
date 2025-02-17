import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/widgets/home/meal_card.dart';

class HomePageIngredientsSection extends StatelessWidget {
  const HomePageIngredientsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...[
                "Chicken",
                "Beef Meat",
                "Octopus",
                "Shrimp",
                "Beef Meat",
                "Octopus",
                "Shrimp"
              ].map((ingredient) {
                return IngredientItem(
                  icon: "",
                  text: ingredient,
                  isActive: ingredient == "Chicken",
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
                  onTap: () => Navigator.pushNamed(context,'/recipe-detail'),
                );
              }),
            ],
          ),
        ),
      ],
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
            // image and sizedBox
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
