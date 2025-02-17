import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LastViewedMealCardForSearchScreen extends StatelessWidget {
  const LastViewedMealCardForSearchScreen({
    super.key,
    required this.name,
    required this.image,
    required this.onTap,
  });

  final String name;
  final String image;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * 0.4;
    return Container(
      width: width,
      margin: const EdgeInsets.only(right: 4, left: 4, top: 5, bottom: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            spreadRadius: 1.5,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            width: width,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              name,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color.fromRGBO(15, 23, 42, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
