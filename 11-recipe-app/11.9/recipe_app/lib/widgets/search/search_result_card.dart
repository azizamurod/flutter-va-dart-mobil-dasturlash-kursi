import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchResultCard extends StatelessWidget {
  const SearchResultCard({
    super.key,
    required this.image,
    required this.name,
    required this.country,
    required this.onTap,
  });

  final String image;
  final String name;
  final String country;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 52 - 70 - 32;
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              image,
              height: 70,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: width,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(15, 23, 42, 1),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      country,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(148, 163, 184, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
