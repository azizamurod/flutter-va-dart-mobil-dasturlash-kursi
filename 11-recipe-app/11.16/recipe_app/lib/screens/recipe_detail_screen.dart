import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '/recipe_model.dart';

import '/widgets/loading.dart';
import '/widgets/error_text.dart';
import '/widgets/recipe_detail/ingredients_section.dart';
import '/widgets/recipe_detail/instructions_section.dart';

class RecipeDetailScreen extends StatefulWidget {
  const RecipeDetailScreen({super.key});

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 0),
      () {
        if (mounted) {
          String mealId = ModalRoute.of(context)!.settings.arguments as String;
          context.read<RecipeModel>().getMealDetails(mealId);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 40),
        child: Stack(
          children: [
            Consumer<RecipeModel>(
              builder: (context, recipeModel, child) {
                return recipeModel.isDetailScreenLoading
                    ? const Padding(
                        padding: EdgeInsets.only(top: 200),
                        child: Loading(),
                      )
                    : (recipeModel.isDetailScreenError
                        ? const Padding(
                            padding: EdgeInsets.only(top: 200),
                            child: ErrorText(),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              recipeModel.mealDetail?.strMealThumb
                                          ?.isNotEmpty ==
                                      true
                                  ? Image.network(
                                      recipeModel.mealDetail!.strMealThumb!,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    )
                                  : const SizedBox(),
                              Padding(
                                padding: const EdgeInsets.all(24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      recipeModel.mealDetail?.strMeal ?? '',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            const Color.fromRGBO(15, 23, 42, 1),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    IngredientsSection(
                                      mealDetail: recipeModel.mealDetail,
                                    ),
                                    InstructionsSection(
                                      mealDetail: recipeModel.mealDetail,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ));
              },
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.only(top: 54, left: 24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Image.asset("assets/icons/arrow-left.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
