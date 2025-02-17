import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '/providers/.providers.dart';

import '/utils/contants/transaction_types.dart';
import '/utils/contants/transaction_categories.dart';

import '/widgets/app_bars/custom_app_bar.dart';
import '/widgets/screens/expense/description_text.dart';
import '/widgets/bottom_sheets/show_remove_bottom_sheet.dart';
import '/widgets/screens/expense/transaction_detail_info_card.dart';
import '/widgets/screens/expense/transaction_amount_and_date_time_card.dart';

class ExpenseDetailScreen extends StatelessWidget {
  const ExpenseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionsProvider>(
      builder: (context, transactionsProvider, _) {
        return Scaffold(
          appBar: CustomAppBar(
            title: 'Detail Transaction',
            backgroundColor: const Color.fromRGBO(253, 60, 74, 1),
            actions: [
              GestureDetector(
                onTap: () => showRemoveBottomSheet(
                  context: context,
                  text: 'transaction',
                  remove: () => transactionsProvider.removeTransaction(context),
                ),
                child: Container(
                  color: Colors.transparent,
                  margin: const EdgeInsets.only(right: 16),
                  child: SvgPicture.asset('assets/icons/trash.svg'),
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TransactionAmountAndDateTimeCard(
                      transaction: transactionsProvider.detailTransaction!,
                    ),
                    const SizedBox(height: 52),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        20,
                        (_) => Container(
                          width: 10,
                          height: 2,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(227, 229, 229, 1),
                            borderRadius: BorderRadius.circular(1),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    TransactionDescriptionText(
                      description:
                          transactionsProvider.detailTransaction!.description,
                    ),
                  ],
                ),
                TransactionDetailInfoCard(
                  type: TransactionTypes.expense,
                  category: transactionsProvider.detailTransaction!.category ??
                      TransactionCategories.shopping,
                  accountName:
                      transactionsProvider.detailTransaction!.account?.name ??
                          '',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
