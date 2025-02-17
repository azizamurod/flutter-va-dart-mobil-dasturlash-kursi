import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '/providers/.providers.dart';

import '/widgets/screens/security_pin/pin_circles.dart';
import '/widgets/screens/security_pin/pin_numbers_section.dart';

class CreatePinScreen extends StatelessWidget {
  const CreatePinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(127, 61, 255, 1),
      body: SafeArea(
        child: Consumer<UserAndNavigationManagementProvider>(
          builder: (context, userAndNavigationManagementProvider, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 46),
                      Text(
                      userAndNavigationManagementProvider.createPin ?  "Let’s  setup your PIN": "Ok. Re type your PIN again.",
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 92),
                      PinCircles(
                        pin: userAndNavigationManagementProvider.createPin
                            ? userAndNavigationManagementProvider.pin
                            : userAndNavigationManagementProvider.retypePin,
                      ),
                    ],
                  ),
                ),
                PinNumbersSection(
                  onTapNumber: (int val) {
                    userAndNavigationManagementProvider.onTapPinNumber(
                      num: val,
                      context: context,
                    );
                  },
                  removeNumber:
                      userAndNavigationManagementProvider.removePinNumber,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
