import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    required this.isFilterExist,
    required this.onTap,
  });

  final bool isFilterExist;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color.fromRGBO(241, 241, 250, 1),
          ),
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            SvgPicture.asset('assets/icons/filter.svg'),
            isFilterExist
                ? Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(127, 61, 255, 1),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
