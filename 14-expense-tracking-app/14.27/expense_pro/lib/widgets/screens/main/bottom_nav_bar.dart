import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.activeScreen,
    required this.changeActiveScreen,
  });

  final int activeScreen;
  final Function(int) changeActiveScreen;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 75,
      color: const Color.fromRGBO(252, 252, 252, 1),
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        children: [
          BottomNavBarItem(
            icon: 'assets/icons/bottom_nav_bar/home.svg',
            text: AppLocalizations.of(context)!.home,
            isActive: activeScreen == 0,
            onTap: () => changeActiveScreen(0),
          ),
          BottomNavBarItem(
            icon: 'assets/icons/bottom_nav_bar/transaction.svg',
            text: AppLocalizations.of(context)!.transaction_uppercase,
            margin: const EdgeInsets.only(right: 40),
            isActive: activeScreen == 1,
            onTap: () => changeActiveScreen(1),
          ),
          BottomNavBarItem(
            icon: 'assets/icons/bottom_nav_bar/budget.svg',
            text: AppLocalizations.of(context)!.budget_uppercase,
            margin: const EdgeInsets.only(left: 40),
            isActive: activeScreen == 2,
            onTap: () => changeActiveScreen(2),
          ),
          BottomNavBarItem(
            icon: 'assets/icons/bottom_nav_bar/profile.svg',
            text: AppLocalizations.of(context)!.profile,
            isActive: activeScreen == 3,
            onTap: () => changeActiveScreen(3),
          ),
        ],
      ),
    );
  }
}

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({
    super.key,
    required this.icon,
    required this.text,
    required this.isActive,
    required this.onTap,
    this.margin,
  });

  final String icon;
  final String text;
  final bool isActive;
  final Function onTap;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          color: Colors.transparent,
          margin: margin,
          child: Column(
            children: [
              SvgPicture.asset(
                icon,
                colorFilter: ColorFilter.mode(
                  isActive
                      ? const Color.fromRGBO(127, 61, 255, 1)
                      : const Color.fromRGBO(198, 198, 198, 1),
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: 4),
              Flexible(
                child: Text(
                  text,
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: isActive
                        ? const Color.fromRGBO(127, 61, 255, 1)
                        : const Color.fromRGBO(198, 198, 198, 1),
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
