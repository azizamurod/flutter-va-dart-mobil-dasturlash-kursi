import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/onboarding_illustration.png",
                    ),
                    const SizedBox(height: 47),
                    Text(
                      'Thousands of tested recipes',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(15, 23, 42, 1),
                      ),

                      /// assets
                      //   style: TextStyle(
                      //     // fontSize: 18,
                      //     fontSize: 28,
                      //     fontFamily: "Poppins", fontStyle: FontStyle.italic,
                      //     fontWeight: FontWeight.w600,
                      //     color: Color.fromRGBO(15, 23, 42, 1),
                      //   ),

                      /// Google fonts
                      // style: GoogleFonts.poppins(
                      //   fontSize: 28,
                      //   fontWeight: FontWeight.w600,
                      //   color: Color.fromRGBO(15, 23, 42, 1),
                      //   fontStyle: FontStyle.italic,
                      // ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'There is no need to fear failure. Tested recipes are guaranteed to work by our professional chefs.',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(156, 163, 175, 1),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(251, 148, 0, 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Get Started',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
