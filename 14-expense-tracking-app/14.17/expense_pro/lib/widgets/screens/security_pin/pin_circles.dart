import 'package:flutter/material.dart';

class PinCircles extends StatelessWidget {
  const PinCircles({
    super.key,
    required this.pin,
  });

  final int? pin;

  @override
  Widget build(BuildContext context) {
    final int pinLength = pin == null ? 0 : pin.toString().length;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        pinLength > 0 ? const FilledCircle() : const EmptyCircle(),
        const SizedBox(width: 16),
        pinLength > 1 ? const FilledCircle() : const EmptyCircle(),
        const SizedBox(width: 16),
        pinLength > 2 ? const FilledCircle() : const EmptyCircle(),
        const SizedBox(width: 16),
        pinLength == 4 ? const FilledCircle() : const EmptyCircle(),
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
