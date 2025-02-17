import 'package:flutter/material.dart';

import 'delete_card.dart';
import 'number_card.dart';

class PinNumbersSection extends StatelessWidget {
  const PinNumbersSection({
    super.key,
    required this.onTapNumber,
    required this.removeNumber,
  });

  final Function(int) onTapNumber;
  final Function() removeNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            NumberCard(number: "1", onTap: () =>onTapNumber(1)),
            NumberCard(number: "2", onTap: () => onTapNumber(2)),
            NumberCard(number: "3", onTap: () => onTapNumber(3)),
          ],
        ),
        Row(
          children: [
            NumberCard(number: "4", onTap: () => onTapNumber(4)),
            NumberCard(number: "5", onTap: () => onTapNumber(5)),
            NumberCard(number: "6", onTap: () => onTapNumber(6)),
          ],
        ),
        Row(
          children: [
            NumberCard(number: "7", onTap: () => onTapNumber(7)),
            NumberCard(number: "8", onTap: () => onTapNumber(8)),
            NumberCard(number: "9", onTap: () => onTapNumber(9)),
          ],
        ),
        Row(
          children: [
            const Expanded(child: SizedBox()),
            NumberCard(number: "0", onTap: () => onTapNumber(0)),
            DeleteCard(onTap: () => removeNumber()),
          ],
        )
      ],
    );
  }
}
