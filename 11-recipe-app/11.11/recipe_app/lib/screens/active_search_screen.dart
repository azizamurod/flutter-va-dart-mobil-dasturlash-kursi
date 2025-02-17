import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/widgets/custom_bottom_nav_bar.dart';
import '/widgets/search/search_result_card.dart';

class ActiveSearchScreen extends StatelessWidget {
  const ActiveSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ListView(
              padding: const EdgeInsets.only(
                left: 26,
                right: 26,
                top: 25,
                bottom: 100,
              ),
              children: [
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(243, 244, 246, 1),
                    contentPadding: const EdgeInsets.all(16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    hintText: 'Type ingredients...',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(156, 163, 175, 1),
                    ),
                    suffixIcon: Image.asset("assets/icons/remove_big.png"),
                  ),
                ),
                const SizedBox(height: 24),
                ...[
                  {
                    "image": "assets/images/search_result_img1.png",
                    "name":
                        "Japanese Fried Noodles Japanese Fried Noodles Japanese Fried Noodles",
                    "country":
                        "Japanese Japanese Fried Noodles Japanese Fried Noodles",
                  },
                  {
                    "image": "assets/images/search_result_img2.png",
                    "name": "Seblak Bandung",
                    "country": "Japanese",
                  },
                  {
                    "image": "assets/images/search_result_img3.png",
                    "name": "Meal with Salmon and Zucchini",
                    "country": "Japanese",
                  },
                  {
                    "image": "assets/images/search_result_img1.png",
                    "name": "Japanese Fried Noodles",
                    "country": "Japanese",
                  },
                  {
                    "image": "assets/images/search_result_img2.png",
                    "name": "Seblak Bandung",
                    "country": "Japanese",
                  },
                  {
                    "image": "assets/images/search_result_img3.png",
                    "name": "Meal with Salmon and Zucchini",
                    "country": "Japanese",
                  },
                ].map((Map<String, String> meal) {
                  return SearchResultCard(
                    image: meal["image"]!,
                    name: meal["name"]!,
                    country: meal["country"]!,
                    onTap: () => Navigator.pushNamed(context, '/recipe-detail'),
                  );
                }),
              ],
            ),
            const CustomBottomNavigationBar(),
          ],
        ),
      ),
    );
  }
}
