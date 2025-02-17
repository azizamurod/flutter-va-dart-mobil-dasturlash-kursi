import 'package:flutter/material.dart';

import '/widgets/buttons/custom_button.dart';
import '/widgets/app_bars/custom_app_bar.dart';
import '/widgets/text_fields/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Sign up',
        backgroundColor: Colors.white,
        textColor: Color.fromRGBO(33, 35, 37, 1),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 56, right: 16, left: 16),
              child: CustomTextField(
                hintText: 'Name',
                controller: TextEditingController(),
              ),
            ),
            CustomButton(
              text: 'Continue',
              margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
