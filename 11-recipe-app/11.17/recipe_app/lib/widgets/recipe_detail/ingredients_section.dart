import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/models/meal_detail_model.dart';

import '/widgets/recipe_detail/circle_and_text.dart';

class IngredientsSection extends StatelessWidget {
  const IngredientsSection({
    super.key,
    required this.mealDetail,
  });

  final MealDetailModel? mealDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Ingredients",
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color.fromRGBO(15, 23, 42, 1),
          ),
        ),
        const SizedBox(height: 14),
        // 1
        mealDetail?.strIngredient1?.isNotEmpty == true
            ? CircleAndTextItem(
                text:
                    "${mealDetail?.strMeasure1 ?? ''} ${mealDetail?.strIngredient1 ?? ''}")
            : const SizedBox(),
        // 2
        mealDetail?.strIngredient2?.isNotEmpty == true
            ? CircleAndTextItem(
                text:
                    "${mealDetail?.strMeasure2 ?? ''} ${mealDetail?.strIngredient2 ?? ''}")
            : const SizedBox(),
        // 3
        mealDetail?.strIngredient3?.isNotEmpty == true
            ? CircleAndTextItem(
                text:
                    "${mealDetail?.strMeasure3 ?? ''} ${mealDetail?.strIngredient3 ?? ''}")
            : const SizedBox(),
        // 4
        mealDetail?.strIngredient4?.isNotEmpty == true
            ? CircleAndTextItem(
                text:
                    "${mealDetail?.strMeasure4 ?? ''} ${mealDetail?.strIngredient4 ?? ''}")
            : const SizedBox(),
        // 5
        mealDetail?.strIngredient5?.isNotEmpty == true
            ? CircleAndTextItem(
                text:
                    "${mealDetail?.strMeasure5 ?? ''} ${mealDetail?.strIngredient5 ?? ''}")
            : const SizedBox(),
        // 6
        mealDetail?.strIngredient6?.isNotEmpty == true
            ? CircleAndTextItem(
                text:
                    "${mealDetail?.strMeasure6 ?? ''} ${mealDetail?.strIngredient6 ?? ''}")
            : const SizedBox(),

        // 7
        mealDetail?.strIngredient7?.isNotEmpty == true
            ? CircleAndTextItem(
                text:
                    "${mealDetail?.strMeasure7 ?? ''} ${mealDetail?.strIngredient7 ?? ''}")
            : const SizedBox(),

        // 8
        mealDetail?.strIngredient8?.isNotEmpty == true
            ? CircleAndTextItem(
                text:
                    "${mealDetail?.strMeasure8 ?? ''} ${mealDetail?.strIngredient8 ?? ''}")
            : const SizedBox(),
        // 9
        mealDetail?.strIngredient9?.isNotEmpty == true
            ? CircleAndTextItem(
                text:
                    "${mealDetail?.strMeasure9 ?? ''} ${mealDetail?.strIngredient9 ?? ''}")
            : const SizedBox(),
        // 10
        mealDetail?.strIngredient10?.isNotEmpty == true
            ? CircleAndTextItem(
                text:
                    "${mealDetail?.strMeasure10 ?? ''} ${mealDetail?.strIngredient10 ?? ''}")
            : const SizedBox(),
        // 11
        mealDetail?.strIngredient11?.isNotEmpty == true
            ? CircleAndTextItem(
                text:
                    "${mealDetail?.strMeasure11 ?? ''} ${mealDetail?.strIngredient11 ?? ''}")
            : const SizedBox(),
        // 12
        mealDetail?.strIngredient12?.isNotEmpty == true
            ? CircleAndTextItem(
                text:
                    "${mealDetail?.strMeasure12 ?? ''} ${mealDetail?.strIngredient12 ?? ''}")
            : const SizedBox(),
        // 13
        mealDetail?.strIngredient13?.isNotEmpty == true
            ? CircleAndTextItem(
                text:
                    "${mealDetail?.strMeasure13 ?? ''} ${mealDetail?.strIngredient13 ?? ''}")
            : const SizedBox(),
        // 14
        mealDetail?.strIngredient14?.isNotEmpty == true
            ? CircleAndTextItem(
                text:
                    "${mealDetail?.strMeasure14 ?? ''} ${mealDetail?.strIngredient14 ?? ''}")
            : const SizedBox(),
        // 15
        mealDetail?.strIngredient15?.isNotEmpty == true
            ? CircleAndTextItem(
                text:
                    "${mealDetail?.strMeasure15 ?? ''} ${mealDetail?.strIngredient15 ?? ''}")
            : const SizedBox(),
        // 16
        mealDetail?.strIngredient16?.isNotEmpty == true
            ? CircleAndTextItem(
                text:
                    "${mealDetail?.strMeasure16 ?? ''} ${mealDetail?.strIngredient16 ?? ''}")
            : const SizedBox(),
        // 17
        mealDetail?.strIngredient17?.isNotEmpty == true
            ? CircleAndTextItem(
                text:
                    "${mealDetail?.strMeasure17 ?? ''} ${mealDetail?.strIngredient17 ?? ''}")
            : const SizedBox(),
        // 18
        mealDetail?.strIngredient18?.isNotEmpty == true
            ? CircleAndTextItem(
                text:
                    "${mealDetail?.strMeasure18 ?? ''} ${mealDetail?.strIngredient18 ?? ''}")
            : const SizedBox(),
        // 19
        mealDetail?.strIngredient19?.isNotEmpty == true
            ? CircleAndTextItem(
                text:
                    "${mealDetail?.strMeasure19 ?? ''} ${mealDetail?.strIngredient19 ?? ''}")
            : const SizedBox(),
        // 20
            mealDetail?.strIngredient20?.isNotEmpty == true
            ? CircleAndTextItem(
                text:
                    "${mealDetail?.strMeasure20 ?? ''} ${mealDetail?.strIngredient20 ?? ''}")
            : const SizedBox(),
        const SizedBox(height: 16),
      ],
    );
  }
}
