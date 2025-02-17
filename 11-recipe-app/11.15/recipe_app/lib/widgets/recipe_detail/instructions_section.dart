import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/models/meal_detail_model.dart';


import '/widgets/recipe_detail/circle_and_text.dart';

class InstructionsSection extends StatelessWidget {
  const InstructionsSection({
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
          "Steps",
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color.fromRGBO(15, 23, 42, 1),
          ),
        ),
        const SizedBox(height: 14),
        ...?mealDetail?.strInstructions
            ?.split('\r\n')
            .where((el) => el.isNotEmpty)
            .map(
          (ingredient) {
            return CircleAndTextItem(text: ingredient);
          },
        ),
      ],
    );
  }
}
