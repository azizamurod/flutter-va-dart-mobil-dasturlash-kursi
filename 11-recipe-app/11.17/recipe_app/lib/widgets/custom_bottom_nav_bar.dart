import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '/recipe_model.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 5,
            blurRadius: 35,
          )
        ],
      ),
      child: Consumer<RecipeModel>(
        builder: (context, recipeModel, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomBottomNavigationBarItem(
                icon: "assets/icons/navbar/home.png",
                text: "Home",
                isActive: recipeModel.activeScreen == 0,
                onTap: () => recipeModel.changeActiveScreen(0),
              ),
              CustomBottomNavigationBarItem(
                icon: "assets/icons/navbar/search.png",
                text: "Search",
                isActive: recipeModel.activeScreen == 1,
                onTap: () => recipeModel.changeActiveScreen(1),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CustomBottomNavigationBarItem extends StatelessWidget {
  const CustomBottomNavigationBarItem({
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
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Image.asset(
              icon,
              color: isActive
                  ? const Color.fromRGBO(248, 152, 0, 1)
                  : const Color.fromRGBO(209, 213, 219, 1),
            ),
            const SizedBox(height: 4),
            Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isActive
                    ? const Color.fromRGBO(248, 152, 0, 1)
                    : const Color.fromRGBO(209, 213, 219, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
