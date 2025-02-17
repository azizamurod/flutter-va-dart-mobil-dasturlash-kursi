import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '/recipe_model.dart';

import '/screens/home_screen.dart';
import '/screens/search_screen.dart';
import '/widgets/custom_bottom_nav_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

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
              padding: const EdgeInsets.only(left: 26, top: 25, bottom: 100),
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 26),
                  child: TextField(
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
                      suffixIcon: Image.asset("assets/icons/search.png"),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Consumer<RecipeModel>(
                  builder: (context, recipeModel, child) {
                    if (recipeModel.activeScreen == 0) {
                      return const HomeScreen();
                    } else {
                      return const SearchScreen();
                    }
                  },
                ),
              ],
            ),
            const CustomBottomNavigationBar(),
          ],
        ),
      ),
    );
  }
}
