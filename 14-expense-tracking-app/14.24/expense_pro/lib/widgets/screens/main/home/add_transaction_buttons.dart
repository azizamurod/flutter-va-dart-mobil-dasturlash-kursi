import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddIncomeButton extends StatelessWidget {
  const AddIncomeButton({
    super.key,
    required this.close,
  });

  final Function close;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        close();
        Navigator.pushNamed(context, '/create-income');
      },
      child: Container(
        width: 56,
        height: 56,
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromRGBO(0, 168, 107, 1),
        ),
        child: SvgPicture.asset(
          'assets/icons/income.svg',
          colorFilter: const ColorFilter.mode(
            Colors.white,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}

class AddTransferButton extends StatelessWidget {
  const AddTransferButton({
    super.key,
    required this.close,
  });

  final Function close;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        close();
        Navigator.pushNamed(context, '/create-transfer');
      },
      child: Container(
        width: 56,
        height: 56,
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromRGBO(0, 119, 255, 1),
        ),
        child: SvgPicture.asset(
          'assets/icons/transfer.svg',
          colorFilter: const ColorFilter.mode(
            Colors.white,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}

class AddExpenseButton extends StatelessWidget {
  const AddExpenseButton({
    super.key,
    required this.close,
  });

  final Function close;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        close();
        Navigator.pushNamed(context, '/create-expense');
      },
      child: Container(
        width: 56,
        height: 56,
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromRGBO(253, 60, 74, 1),
        ),
        child: SvgPicture.asset(
          'assets/icons/expense.svg',
          colorFilter: const ColorFilter.mode(
            Colors.white,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
