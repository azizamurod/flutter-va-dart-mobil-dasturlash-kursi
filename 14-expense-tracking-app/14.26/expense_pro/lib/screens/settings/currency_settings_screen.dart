import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/.providers.dart';

import '/widgets/app_bars/custom_app_bar.dart';
import '/widgets/screens/settings/settings_select_card.dart';

class CurrencySettingsScreen extends StatelessWidget {
  const CurrencySettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Currency',
        textColor: Color.fromRGBO(33, 35, 37, 1),
      ),
      body: SafeArea(
        child:
            Consumer<SettingsProvider>(builder: (context, settingsProvider, _) {
          return Column(
            children: [
              Container(
                height: 1,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 16),
                color: const Color.fromRGBO(245, 245, 245, 1),
              ),
              ...[
                {
                  'text': 'United States (USD)',
                  'is_selected': settingsProvider.currency == 'USD',
                  'currency': 'USD',
                },
                {
                  'text': 'Uzbek (SO’M)',
                  'is_selected': settingsProvider.currency == 'SOM',
                  'currency': 'SOM',
                },
                {
                  'text': 'Russia (RUB)',
                  'is_selected': settingsProvider.currency == 'RUB',
                  'currency': 'RUB',
                },
              ].map(
                (el) {
                  return SettingsSelectCard(
                    text: el['text'] as String,
                    isSelected: el['is_selected'] as bool,
                    onTap: () => settingsProvider.changeCurrency(
                      el['currency'] as String,
                    ),
                  );
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
