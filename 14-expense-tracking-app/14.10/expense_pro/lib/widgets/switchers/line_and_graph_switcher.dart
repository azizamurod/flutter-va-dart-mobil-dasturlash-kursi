import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LineAndGraphSwitcher extends StatelessWidget {
  const LineAndGraphSwitcher({
    super.key,
    required this.icon,
    required this.isActive,
    required this.isLeftSide,
    required this.onTap,
  });

  final String icon;
  final bool isActive;
  final bool isLeftSide;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color:
              isActive ? const Color.fromRGBO(127, 61, 255, 1) : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isLeftSide ? 8 : 0),
            bottomLeft: Radius.circular(isLeftSide ? 8 : 0),
            topRight: Radius.circular(!isLeftSide ? 8 : 0),
            bottomRight: Radius.circular(!isLeftSide ? 8 : 0),
          ),
          border: Border.all(
            color: isActive
                ? const Color.fromRGBO(127, 61, 255, 1)
                : const Color.fromRGBO(241, 241, 250, 1),
          ),
        ),
        child: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(
            isActive ? Colors.white : const Color.fromRGBO(127, 61, 255, 1),
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
