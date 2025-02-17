import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '/widgets/buttons/custom_button.dart';
import '/widgets/app_bars/custom_app_bar.dart';
import '/widgets/text_fields/custom_text_field.dart';
import '/widgets/text_fields/transaction_amount_text_field.dart';
import '/widgets/text_fields/select_card_without_arrow_down.dart';

class CreateTransferScreen extends StatelessWidget {
  const CreateTransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 119, 255, 1),
      appBar: const CustomAppBar(title: 'Transfer'),
      body: Column(
        children: [
          const SizedBox(height: 206),
          TransactionAmountTextField(
            controller: TextEditingController(text: '0'),
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
                  Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Row(
                            children: [
                              SelectCardWithoutArrowDown(
                                text: 'From',
                                isSelected: false,
                                onTap: () {},
                              ),
                              const SizedBox(width: 16),
                              SelectCardWithoutArrowDown(
                                text: 'To',
                                isSelected: false,
                                onTap: () {},
                              ),
                            ],
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                color: const Color.fromRGBO(241, 241, 250, 1),
                              ),
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/transaction.svg',
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        hintText: 'Description',
                        controller: TextEditingController(),
                      ),
                    ],
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
