import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'last_viewed_meal_card.dart';

class LastViewedSection extends StatelessWidget {
  const LastViewedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/last-viewed'),
                child: Text(
                  "See All",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(251, 148, 0, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 155,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...[
                {
                  "image": "assets/images/last_viewed_img1.png",
                  "name": "Spicy Fish Soup",
                },
                {
                  "image": "assets/images/last_viewed_img2.png",
                  "name": "Cookies",
                },
                {
                  "image": "assets/images/last_viewed_img3.png",
                  "name": "Pineapple Juice",
                },
              ].map((Map<String, String> meal) {
                return LastViewedMealCardForSearchScreen(
                  image: meal["image"]!,
                  name: meal["name"]!,
                  onTap: () => Navigator.pushNamed(context, '/recipe-detail'),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
