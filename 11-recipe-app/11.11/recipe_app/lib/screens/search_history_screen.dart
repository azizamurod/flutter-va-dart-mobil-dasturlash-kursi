import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/widgets/last_viewed/last_viewed_meal_card.dart';
import 'package:recipe_app/widgets/search/search_history_item.dart';

class SearchHistoryScreen extends StatelessWidget {
  const SearchHistoryScreen({super.key});

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
          "Search History",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color.fromRGBO(15, 23, 42, 1),
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            ...[
              "Javanese Fried Noodles Javanese Fried Noodles Javanese Fried Noodles",
              "Chicken Curry",
              "Javanese Fried Noodles",
              "Chicken Curry",
              "Javanese Fried Noodles",
              "Chicken Curry",
              "Javanese Fried Noodles",
              "Chicken Curry",
              "Javanese Fried Noodles",
              "Chicken Curry",
              "Javanese Fried Noodles",
              "Chicken Curry",
              "Javanese Fried Noodles",
              "Chicken Curry",
              "Javanese Fried Noodles",
              "Chicken Curry",
              "Javanese Fried Noodles",
              "Chicken Curry",
              "Javanese Fried Noodles",
              "Chicken Curry",
              "Javanese Fried Noodles",
              "Chicken Curry",
              "Javanese Fried Noodles",
              "Chicken Curry",
              "Javanese Fried Noodles",
              "Chicken Curry",
              "Javanese Fried Noodles",
              "Chicken Curry",
              "Javanese Fried Noodles",
              "Chicken Curry",
              "Javanese Fried Noodles",
              "Chicken Curry",
            ].map(
              (el) {
                return SearchHistoryItem(
                  text: el,
                  onTap: () {},
                  remove: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
