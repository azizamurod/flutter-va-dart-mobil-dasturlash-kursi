import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/widgets/screens/security_pin/pin_circles.dart';
import '/widgets/screens/security_pin/pin_numbers_section.dart';

class SecurityPinScreen extends StatelessWidget {
  const SecurityPinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(127, 61, 255, 1),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 46),
                  Text(
                    "Please type your PIN",
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 92),
                  const PinCircles(),
                ],
              ),
            ),
            const PinNumbersSection()
          ],
        ),
      ),
    );
  }
}
