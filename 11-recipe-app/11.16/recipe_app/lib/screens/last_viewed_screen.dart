import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '/recipe_model.dart';

import '/widgets/last_viewed/last_viewed_meal_card.dart';

class LastViewedScreen extends StatelessWidget {
  const LastViewedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leadingWidth: 64,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.only(left: 24),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(242, 242, 242, 1),
              shape: BoxShape.circle,
            ),
            child: Image.asset("assets/icons/arrow-left.png"),
          ),
        ),
        title: Text(
          "Last viewed",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color.fromRGBO(15, 23, 42, 1),
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Consumer<RecipeModel>(builder: (context, recipeModel, child) {
          return GridView.builder(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              top: 29,
              bottom: 30,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 16,
              childAspectRatio: 0.88,
            ),
            itemCount: recipeModel.lastViewedMeals.length,
            itemBuilder: (context, index) {
              return LastViewedMealCard(
                image: recipeModel.lastViewedMeals[index].strMealThumb ?? '',
                name: recipeModel.lastViewedMeals[index].strMeal ?? '',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/recipe-detail',
                    arguments: recipeModel.lastViewedMeals[index].idMeal,
                  );
                  recipeModel.addToLastViewed(
                    recipeModel.lastViewedMeals[index],
                  );
                },
              );
            },
          );
        }),
      ),
    );
  }
}
