import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/providers/.providers.dart';

import '/widgets/buttons/custom_button.dart';
import '/widgets/app_bars/custom_app_bar.dart';
import '/widgets/text_fields/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(
        title: AppLocalizations.of(context)!.sign_up,
        backgroundColor: Colors.white,
        textColor: const Color.fromRGBO(33, 35, 37, 1),
      ),
      body: SafeArea(
        child: Consumer<UserAndNavigationManagementProvider>(builder: (
          context,
          userAndNavigationManagementProvider,
          child,
        ) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 56, right: 16, left: 16),
                child: CustomTextField(
                  hintText: AppLocalizations.of(context)!.name,
                  controller:
                      userAndNavigationManagementProvider.nameController,
                ),
              ),
              CustomButton(
                text: AppLocalizations.of(context)!.continue_text,
                margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                onTap: () => userAndNavigationManagementProvider.signUp(
                  context,
                ),
              ),
            ],
          );
        },),
      ),
    );
  }
}
