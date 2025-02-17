import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'search_history_item.dart';

class SearchHistorySection extends StatelessWidget {
  const SearchHistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 26),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Search history",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(15, 23, 42, 1),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/search-history',
                  );
                },
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
          const SizedBox(height: 19),
          ...[
            "Japanese Fried Noodles",
            "Chicken Curry",
            "Japanese Fried Noodles",
            "Chicken Curry",
            "Japanese Fried Noodles",
            "Chicken Curry",
          ].map((el) {
            return SearchHistoryItem(
              text: el,
              onTap: () {},
              remove: () {},
            );
          }),
        ],
      ),
    );
  }
}
