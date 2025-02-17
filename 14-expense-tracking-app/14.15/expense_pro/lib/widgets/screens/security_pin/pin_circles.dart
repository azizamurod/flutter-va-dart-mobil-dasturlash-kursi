import 'package:flutter/material.dart';

class PinCircles extends StatelessWidget {
  const PinCircles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FilledCircle(),
        SizedBox(width: 16),
        EmptyCircle(),
        SizedBox(width: 16),
        EmptyCircle(),
        SizedBox(width: 16),
        EmptyCircle(),
      ],
    );
  }
}

class EmptyCircle extends StatelessWidget {
  const EmptyCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color.fromRGBO(238, 229, 255, 1),
          width: 4,
        ),
      ),
    );
  }
}

class FilledCircle extends StatelessWidget {
  const FilledCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}
