import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '/recipe_model.dart';

import '/widgets/error_text.dart';
import '/screens/home_screen.dart';
import '/screens/search_screen.dart';
import '/widgets/custom_bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    context.read<RecipeModel>().getInitialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Consumer<RecipeModel>(builder: (context, recipeModel, child) {
          return recipeModel.isInitialDataError
              ? const ErrorText()
              : Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ListView(
                      padding:
                          const EdgeInsets.only(left: 26, top: 25, bottom: 100),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 26),
                          child: TextField(
                            controller: recipeModel.searchController,
                            onTap: () => recipeModel.searchTextFieldOnTap(),
                            onChanged: (value) => recipeModel.search(value),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color.fromRGBO(243, 244, 246, 1),
                              contentPadding: const EdgeInsets.all(16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              hintText: 'Type ingredients...',
                              hintStyle: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(156, 163, 175, 1),
                              ),
                              suffixIcon:
                                  recipeModel.searchController.text.isEmpty
                                      ? Image.asset("assets/icons/search.png")
                                      : GestureDetector(
                                          onTap: () => recipeModel.search(''),
                                          child: Image.asset(
                                            "assets/icons/remove_big.png",
                                          ),
                                        ),
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
                );
        }),
      ),
    );
  }
}
