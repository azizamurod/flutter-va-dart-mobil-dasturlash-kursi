import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '/providers/.providers.dart';

import '/widgets/bottom_sheets/show_filter_transactions_bottom_sheet.dart';


class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionsProvider>(
        builder: (context, transactionsProvider, _) {
      return GestureDetector(
        onTap: () => showFilterTransactionsBottomSheet(
          context: context,
          transactionsProvider: transactionsProvider,
        ),
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
              transactionsProvider.hasFilters()
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
    });
  }
}
