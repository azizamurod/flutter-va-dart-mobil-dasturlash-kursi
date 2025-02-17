import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class DeleteCard extends StatelessWidget {
  const DeleteCard({
    super.key,
    required this.onTap,
  });

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          color: Colors.transparent,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
            width: 64,
            height: 64,
          ),
        ),
      ),
    );
  }
}
