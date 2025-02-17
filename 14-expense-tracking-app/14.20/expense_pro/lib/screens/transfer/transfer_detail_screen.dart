import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '/widgets/app_bars/custom_app_bar.dart';
import '/widgets/dialogs/show_deleted_dialog.dart';
import '/widgets/screens/expense/description_text.dart';
import '/widgets/bottom_sheets/show_remove_bottom_sheet.dart';
import '/widgets/screens/transfer/transfer_detail_info_card.dart';
import '/widgets/screens/expense/transaction_amount_and_date_time_card.dart';

class TransferDetailScreen extends StatelessWidget {
  const TransferDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Detail Transaction',
        backgroundColor: const Color.fromRGBO(0, 119, 255, 1),
        actions: [
          GestureDetector(
            onTap: () => showRemoveBottomSheet(
              context: context,
              text: 'transaction',
              remove: () {
                Navigator.pop(context);
                         showDeletedDialog(context: context, text: 'Transaction');

              },
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
                  color: const Color.fromRGBO(0, 119, 255, 1),
                  transactionAmount: 2000,
                  dateTime: DateTime.now(),
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
                const TransactionDescriptionText(
                  description:
                      'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
                ),
              ],
            ),
            const TransferDetailInfoCard(
              fromAccountName: 'Paypal',
              toAccountName: 'Chase',
            ),
          ],
        ),
      ),
    );
  }
}
