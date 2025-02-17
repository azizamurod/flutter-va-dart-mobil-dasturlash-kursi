import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DayWeekMonthSwitcher extends StatelessWidget {
  const DayWeekMonthSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color.fromRGBO(252, 252, 252, 1),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          DayWeekMonthSwitcherItem(
            text: 'Today',
            isActive: true,
            onTap: () {},
          ),
          DayWeekMonthSwitcherItem(
            text: 'Week',
            isActive: false,
            onTap: () {},
          ),
          DayWeekMonthSwitcherItem(
            text: 'Month',
            isActive: false,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class DayWeekMonthSwitcherItem extends StatelessWidget {
  const DayWeekMonthSwitcherItem({
    super.key,
    required this.text,
    required this.isActive,
    required this.onTap,
  });

  final String text;
  final bool isActive;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isActive
              ? const Color.fromRGBO(252, 238, 212, 1)
              : Colors.transparent,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 24,
        ),
        child: Text(
          text,
          style: isActive
              ? GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromRGBO(252, 172, 18, 1),
                )
              : GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(145, 145, 159, 1),
                ),
        ),
      ),
    );
  }
}
