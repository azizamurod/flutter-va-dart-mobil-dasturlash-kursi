import 'package:flutter/material.dart';

class MealImageAndBackButton extends StatelessWidget {
  const MealImageAndBackButton({
    super.key,
    required this.image,
  });

  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          image,
          width: double.infinity,
          fit: BoxFit.cover,
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
    );
  }
}
