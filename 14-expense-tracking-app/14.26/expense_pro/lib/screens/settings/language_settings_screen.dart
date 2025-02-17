import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/.providers.dart';

import '/widgets/app_bars/custom_app_bar.dart';
import '/widgets/screens/settings/settings_select_card.dart';

class LanguageSettingsScreen extends StatelessWidget {
  const LanguageSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Language',
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
                  'text': 'English (EN)',
                  'is_selected': settingsProvider.language == 'EN',
                  'language': 'EN',
                },
                {
                  'text': 'Uzbek (UZ)',
                  'is_selected': settingsProvider.language == 'UZ',
                  'language': 'UZ',
                },
                {
                  'text': 'Russian (RU)',
                  'is_selected': settingsProvider.language == 'RU',
                  'language': 'RU',
                },
              ].map(
                (el) {
                  return SettingsSelectCard(
                    text: el['text'] as String,
                    isSelected: el['is_selected'] as bool,
                    onTap: () => settingsProvider.changeLanguage(
                      el['language'] as String,
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
