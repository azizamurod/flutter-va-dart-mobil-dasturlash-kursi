import 'package:flutter/material.dart';

class ThreeDots extends StatelessWidget {
  const ThreeDots({
    super.key,
    required this.activeIndex,
  });

  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        activeIndex == 0 ? const ActiveDot() : const InactiveDot(),
        const SizedBox(width: 16),
        activeIndex == 1 ? const ActiveDot() : const InactiveDot(),
        const SizedBox(width: 16),
        activeIndex == 2 ? const ActiveDot() : const InactiveDot(),
      ],
    );
  }
}

class InactiveDot extends StatelessWidget {
  const InactiveDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(238, 229, 255, 1),
      ),
    );
  }
}

class ActiveDot extends StatelessWidget {
  const ActiveDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16,
      width: 16,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(127, 61, 255, 1),
      ),
    );
  }
}
