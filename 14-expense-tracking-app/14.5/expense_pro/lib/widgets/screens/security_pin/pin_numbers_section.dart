import 'package:flutter/material.dart';

import 'delete_card.dart';
import 'number_card.dart';

class PinNumbersSection extends StatelessWidget {
  const PinNumbersSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            NumberCard(number: "1", onTap: () {}),
            NumberCard(number: "2", onTap: () {}),
            NumberCard(number: "3", onTap: () {}),
          ],
        ),
        Row(
          children: [
            NumberCard(number: "4", onTap: () {}),
            NumberCard(number: "5", onTap: () {}),
            NumberCard(number: "6", onTap: () {}),
          ],
        ),
        Row(
          children: [
            NumberCard(number: "7", onTap: () {}),
            NumberCard(number: "8", onTap: () {}),
            NumberCard(number: "9", onTap: () {}),
          ],
        ),
        Row(
          children: [
            const Expanded(child: SizedBox()),
            NumberCard(number: "0", onTap: () {}),
            DeleteCard(onTap: () {}),
          ],
        )
      ],
    );
  }
}
