import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '/widgets/buttons/custom_button.dart';
import '/widgets/app_bars/custom_app_bar.dart';
import '/widgets/dialogs/show_deleted_dialog.dart';
import '/widgets/text_fields/custom_text_field.dart';
import '/widgets/bottom_sheets/show_remove_bottom_sheet.dart';
import '/widgets/text_fields/transaction_amount_text_field.dart';

class EditAccountScreen extends StatelessWidget {
  const EditAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(127, 61, 255, 1),
      appBar: CustomAppBar(
        title: 'Edit account',
        actions: [
          GestureDetector(
            onTap: () => showRemoveBottomSheet(
              context: context,
              text: 'account',
              remove: () {
                Navigator.pop(context);
                showDeletedDialog(context: context, text: 'Account');
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
      body: Column(
        children: [
          const SizedBox(height: 206),
          TransactionAmountTextField(
            text: 'Balance',
            controller: TextEditingController(text: '2400'),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 24,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextField(
                    hintText: 'Name',
                    controller: TextEditingController(),
                  ),
                  CustomButton(
                    text: 'Continue',
                    margin: const EdgeInsets.only(bottom: 32),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
